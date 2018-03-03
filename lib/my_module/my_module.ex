defmodule MyModule do

  alias TrippingExceptions

  # Do we want to encourage encapsulating all exceptions in their own nested module?  May be overkill in most cases
  defmodule Exceptions do

    defmodule SomeError do
      # TODO: add syntax to "derive" from TrippingException?

      defexception [:status, :message, :more_info, :stack ]

      def exception(response) do
        %{
          status: 404,
          message: "Could not access State geo ids.  Response: '#{response}'",
          more_info: "https://tripping.atlassian.net/wiki/spaces/TECH/pages/303005720/StateGeoUnavailableError",
          stack: Process.info(self(), :current_stacktrace)
        }
      end
    end
  end

  def go() do
    raise Exceptions.SomeError, "This is an example body returned from failing service call"
  end

end