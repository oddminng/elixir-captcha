defmodule Captcha do
  def get(_timeout \\ 10_000) do
    case System.cmd(Application.app_dir(:captcha, "priv/captcha"), []) do
      {data, 0} ->
        <<text::bytes-size(5), img::binary>> = data
        {:ok, text, img}

      _other ->
        :error
    end
  end
end
