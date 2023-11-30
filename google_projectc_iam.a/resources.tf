resource "google_artifact_registry_repository" "foobar" {
  repository_id = "foobar"
  format        = "DOCKER"
}

resource "google_service_account" "foobar" {
  account_id = "foobar"
}

resource "google_service_account" "foobaz" {
  account_id = "foobaz"
}

resource "google_service_account_key" "foobar" {
  service_account_id = google_service_account.foobar.name
  public_key_type    = "TYPE_X509_PEM_FILE"
}

resource "google_project_iam_binding" "foobar-w" {
  project = "augustfengd"
  role    = "roles/artifactregistry.writer"

  members = [
    google_service_account.foobar.member
  ]
}

resource "google_project_iam_binding" "foobar-r" {
  project = "augustfengd"
  role    = "roles/artifactregistry.reader"

  members = [
    google_service_account.foobar.member
  ]
}

resource "google_project_iam_binding" "foobaz-w" {
  project = "augustfengd"
  role    = "roles/artifactregistry.writer"

  members = [
    google_service_account.foobaz.member
  ]
}
