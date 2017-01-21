defmodule YawsEx.Appmods.Echo do
  import YawsEx.Yaws, only: [html: 1]

  def out(arg) do
    '/echo' ++ text = :yaws_api.arg_server_path(arg)        
    html "/echo#{text}"
  end

end
