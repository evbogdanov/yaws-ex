defmodule YawsExTest do
  use ExUnit.Case

  test "/hello" do
    assert {:ok, {{_, 200, _}, _, 'Hello, Yaws!'}}
    = :httpc.request('http://127.0.0.1:4000/hello')
  end

  test "/echo" do
    assert {:ok, {{_, 200, _}, _, '/echo'}}
    = :httpc.request('http://127.0.0.1:4000/echo')

    assert {:ok, {{_, 200, _}, _, '/echo/echo'}}
    = :httpc.request('http://127.0.0.1:4000/echo/echo')
  end

  test "/echo with unicode" do
    assert {:ok, {{_, 200, _}, _, body}}
    = :httpc.request('http://127.0.0.1:4000/echo/%D1%8D%D1%85%D0%BE')
 
    assert "/echo/эхо"
    == :erlang.list_to_binary(body)
  end

  test "/index.yaws" do
    assert {:ok, {{_, 200, _}, _, body}}
    = :httpc.request('http://127.0.0.1:4000/index.yaws')

    assert ~s(<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Yaws</title>
</head>
<body>
<h1>I ♥ Yaws</h1>
</body>
</html>
) == :erlang.list_to_binary(body)
  end

end
