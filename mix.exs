defmodule YawsEx.Mixfile do
  use Mix.Project

  def project do
    [app: :yaws_ex,
     version: "0.1.0",
     elixir: "~> 1.4",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [extra_applications: [:logger,
                          :inets],
     mod: {YawsEx, []}]
  end

  defp deps do
    # Don't run Yaws automatically. I'll start it manually in embedded mode.
    [{:yaws, github: "klacke/yaws", runtime: false}]
  end
end
