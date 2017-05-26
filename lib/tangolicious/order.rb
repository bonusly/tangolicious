require 'tangolicious/request'

module Tangolicious
  class Order < Request
    class << self
      def list
        new.get(endpoint)
      end

      def retrieve(id)
        new.get("#{endpoint}/#{id}")
      end

      def create(params)
        new.post(endpoint, create_order_criteria(params))
      end

      def resend(params)
        new.post("#{endpoint}/#{id}/resends", params)
      end

      private

      def endpoint
        'orders'
      end

      def create_order_criteria(params)
        {
          accountIdentifier: params[:account_identifier],
          amount: params[:amount],
          campaign: params[:campaign],
          customerIdentifier: params[:customer_identifier],
          emailSubject: params[:email_subject],
          externalRefID: params[:external_ref_id],
          message: params[:message],
          notes: params[:notes],
          recipient: {
            email: params[:email],
            firstName: params[:first_name],
            lastName: params[:last_name]
          },
          sendEmail: params[:send_email],
          sender: {
            email: params[:email],
            firstName: params[:first_name],
            lastName: params[:last_name]
          },
          utid: params[:utid]
        }
      end
    end
  end
end
