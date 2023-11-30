output "private_key" {
  value = google_service_account_key.foobar.private_key
  sensitive = true
}
