defmodule CrawlerEx do
  @moduledoc """
  Documentation for CrawlerEx.
  """

  @doc """
  Crawls Website and parses video links

  ## Examples

      iex> :foo
      :foo

  """
  def crawl(url) do
    HTTPoison.get(url)
  end

  def parse_response(response) do

    case response do
      {:ok, %{ body: body, status_code: 200}} -> { :ok, body } 

      {:ok, %{body: _, status_code: _ }} -> :notgood 

      {:error, _ } -> :notgood  
    end

  end

end
