defmodule CrawlerExTest do
  use ExUnit.Case
  # doctest CrawlerEx

  test "gets back the url passed" do
    url = "https://www.cleartrip.com/"

    {:ok, response} = CrawlerEx.crawl(url)
    %{body: body, status_code: status} = response
    assert status == 200
  end

  test "parses the response error" do
    assert CrawlerEx.parse_response({:error, "Whatever" }) == :notgood
  end

  test "parses the response ok" do
    assert { :ok, _ } = CrawlerEx.parse_response({ :ok, %{body: {}, status_code: 200} })
  end

  test "parses the response error codes" do
    assert CrawlerEx.parse_response({ :ok, %{body: {}, status_code: 300} }) == :notgood
  end
end
