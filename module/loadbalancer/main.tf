resource "google_compute_region_network_endpoint_group" "function_neg" {
  name                  = "${var.neg}-${var.env}"
  network_endpoint_type = var.network_endpoint_type
  region                = var.region
  cloud_function {
    function = "function-hello-world"
  }
}

resource "google_compute_backend_service" "function_backend" {
  provider                        = google-beta
  name                            = "${var.lb_backend_name}-${var.env}"
  enable_cdn                      = true
  connection_draining_timeout_sec = 10
  custom_request_headers          = ["host: ${google_compute_region_network_endpoint_group.function_neg.id}"]
  custom_response_headers         = ["X-Cache-Hit: {cdn_cache_status}"]
  backend {
    group = google_compute_region_network_endpoint_group.function_neg.id
  }
}

resource "google_compute_url_map" "function_url_map" {
  name            = "${var.lb_url_map}-${var.env}"
  default_service = google_compute_backend_service.function_backend.id
}

resource "google_compute_target_http_proxy" "http_proxy" {
  name    = "${var.http_proxy}-${var.env}"
  url_map = google_compute_url_map.function_url_map.id
}


resource "google_compute_global_forwarding_rule" "function_forwarding_rule" {
  name                  = "${var.lb_forwarding_rule}-${var.env}"
  provider              = google-beta
  load_balancing_scheme = "EXTERNAL"
  port_range            = "80"
  target                = google_compute_target_http_proxy.http_proxy.id
  network_tier          = "PREMIUM"
  depends_on = [ google_compute_target_http_proxy.http_proxy,google_compute_backend_service.function_backend ]
}

