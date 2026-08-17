class RigCli < Formula
  include Language::Python::Virtualenv

  desc "Vehicle-level sensor-stack orchestrator (ROS 2 / Zenoh / Docker deployments)"
  homepage "https://github.com/christomaszewski/rig"
  url "https://github.com/christomaszewski/rig/archive/refs/tags/v0.1.68.tar.gz"
  sha256 "bfeb69b012b449f4d060432c61b2cc2b86f4b4c58e7b5b0242156f3dcac80940"

  conflicts_with "rig", because: "homebrew-core's rig (an identity generator) also installs a `rig` executable"

  depends_on "python@3.13"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      First run per user: `rig setup` creates ~/.rig and subscribes the default
      public registry. `brew uninstall rig` never touches ~/.rig — run
      `rig setup --purge` first if you want the user state gone too.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/rig --version")
  end
end
