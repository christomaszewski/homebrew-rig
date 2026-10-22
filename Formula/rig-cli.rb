class RigCli < Formula
  include Language::Python::Virtualenv

  desc "Vehicle-level sensor-stack orchestrator (ROS 2 / Zenoh / Docker deployments)"
  homepage "https://github.com/christomaszewski/rig"
  url "https://github.com/christomaszewski/rig/archive/refs/tags/v0.2.71.tar.gz"
  sha256 "1331939fa9d9dff1a31252954ec50b9494af627bda11816b9dd14bf0bb1d4a56"

  conflicts_with "rig", because: "homebrew-core's rig (an identity generator) also installs a `rig` executable"

  depends_on "python@3.13"

  resource "pyyaml" do
    url "https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2/pyyaml-6.0.3.tar.gz"
    sha256 "d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f"
  end

  def install
    virtualenv_install_with_resources
    # rig >= 0.2.26: TAB completion (bash/zsh only — no fish emitter yet)
    generate_completions_from_executable(bin/"rig", "completion", shells: [:bash, :zsh])
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
