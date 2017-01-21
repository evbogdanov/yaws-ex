defmodule YawsEx.Appmods.Hello do
  import YawsEx.Yaws, only: [html: 1]  

  def out(_arg) do
    html "Hello, Yaws!"
  end

end
