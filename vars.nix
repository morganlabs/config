pkgs: {
  # TODO: Make SSH port a secret custom value
  ssh.port = 22;
  user = {
    username = "morgan";
    name = "Morgan Jones";
    email = "me@morganlabs.dev";
  };

  git.ssh.pubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBNv1xhpJxFP8KP0+ai4+sK6HRu70J6Nq/u4dU27MixM";
}
