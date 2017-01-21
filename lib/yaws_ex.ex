defmodule YawsEx do
  use Application

  alias YawsEx.Yaws

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    # Start supervisor without children
    {:ok, sup_pid} = Supervisor.start_link([], strategy: :one_for_one)

    # Obtain Yaws configuration
    {:ok, server_conf, global_conf, child_specs} = Yaws.get_conf()

    # Start Yaws under my supervisor
    child_specs
    |> Enum.each(fn(child) -> Supervisor.start_child(sup_pid, child) end)

    # Apply Yaws configuration
    Yaws.set_conf(global_conf, server_conf)

    # Don't forget to return supervisor pid
    {:ok, sup_pid}
  end

end
