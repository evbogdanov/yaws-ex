defmodule YawsEx.Yaws do

  import YawsEx.Appmods
  
  def set_conf(global_conf, server_conf) do
    :yaws_api.setconf(global_conf, server_conf)    
  end

  def get_conf do
    server_id = 'my_server'

    docroot = Path.join(File.cwd!, "www")  |> String.to_charlist
    logdir  = Path.join(File.cwd!, "priv") |> String.to_charlist

    server_conf = [docroot: docroot,
                   port: 4000,
                   listen: {127,0,0,1},
                   appmods: appmods()]

    global_conf = [logdir: logdir,
                   id: server_id]

    :yaws_api.embedded_start_conf(docroot, server_conf, global_conf, server_id)    
  end

  def html(content) do
    {:content, "text/html; charset=utf-8", content}
  end

end
