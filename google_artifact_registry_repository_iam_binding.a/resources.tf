resource "google_artifact_registry_repository" "x" {
  repository_id = "x"
  format        = "DOCKER"
}

resource "google_service_account" "foobar" {
  account_id = "foobar"
}

resource "google_service_account" "foobaz" {
  account_id = "foobaz"
}

resource "google_artifact_registry_repository_iam_binding" "foobar" {
  location   = google_artifact_registry_repository.x.location
  repository = google_artifact_registry_repository.x.name
  role       = "roles/artifactregistry.reader"

  members = [
    google_service_account.foobar.member
  ]
}

resource "google_artifact_registry_repository_iam_binding" "foobaz" {
  location   = google_artifact_registry_repository.x.location
  repository = google_artifact_registry_repository.x.name
  role       = "roles/artifactregistry.reader"

  members = [
    google_service_account.foobaz.member
  ]
}
