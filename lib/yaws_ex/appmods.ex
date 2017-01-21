defmodule YawsEx.Appmods do

  def appmods do
    [{'/hello', YawsEx.Appmods.Hello},
     {'/echo',  YawsEx.Appmods.Echo}]
  end

end
