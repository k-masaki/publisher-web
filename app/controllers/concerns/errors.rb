module Concerns
  module Errors

    class NbsError < StandardError
    end

    # 4xx / 5xx errors
    HTTPResponseErrors = {
      # code:                status
      bad_request:           400, # 400 BadRequest
      unauthorized:          401, # 401 Unauthorized
      forbidden:             403, # 403 Forbidden
      not_found:             404, # 404 NotFound
      internal_server_error: 500, # 500 InternalServerError
    }

    #
    # base of HTTPResponseErrors class
    #
    class HTTPResponseError < NbsError

      attr_accessor :code, :message, :errors

      def initialize(args = {})
        super

        if args.is_a? Hash
          @code    = args[:code]
          @errors  = args[:errors]
          @message = args[:message]
        end

        self
      end

      def capitalize_with_space(str, delimiter = '_')
        str.split(delimiter).map(&:capitalize).join(' ') if str.present?
      end

    end

    HTTPResponseErrors.each do |code ,status|
      class_eval <<-EOS
        class #{code.to_s.camelize} < HTTPResponseError
          def status
            HTTPResponseErrors[:#{code}]
          end

          def code
            @code || "#{code}"
          end

          def message
            @message || ("#{status} " + capitalize_with_space("#{code}"))
          end
        end
      EOS
    end

  end
end