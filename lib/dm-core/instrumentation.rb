module DataMapper
  module Instrumentation
    def instrument(name, payload = {})
      Instrumentation.backend.run(name, payload) do
        yield payload
      end
    end

    def self.backend
      @backend ||= DefaultInstrumentor.new
    end

    def self.backend=(backend)
      @backend = backend
    end

    class DefaultInstrumentor
      def run(*)
        yield
      end
    end
  end
end
