job "rust-demo" {
  datacenters = ["awetza"]
  group "backend" {
    update {
      max_parallel = 1
      canary       = 1
      auto_revert  = true
      auto_promote = false
    }

    task "app" {
      driver = "docker"
      config {
        image = "${artifact.image}:${artifact.tag}"
      }
    }
  }
}
