project = "rust-demo"

app "rust-demo" {

  build {
    use "docker" {
      buildkit           = false
      disable_entrypoint = false
    }
  }

  deploy {
    use "nomad-jobspec" {
      // Templated to perhaps bring in the artifact from a previous
      // build/registry, entrypoint env vars, etc.
      jobspec = templatefile("${path.app}/app.nomad.tpl")
    }
  }
}
