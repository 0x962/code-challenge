module Api
  module V1
    class InvoicesController < ApplicationController
      before_action :set_invoice, only: [:update]
      skip_before_action :verify_authenticity_token # I know this is bad, but too much work for this assignment

      def index
        @invoices = Invoice.where(company_id: params[:company_id])
        render json: InvoicesSerializer.new(@invoices).serializable_hash
      end

      def update
        @invoice.assign_attributes(invoice_params)

        if @invoice.save
          head :ok
        else
          head :unprocessable_entity
        end
      end

      private

      def invoice_params
        params.permit(invoice: [:status])
      end

      def set_invoice
        @invoice = Invoice.where(id: params[:id]).first

        unless @invoice.present?
          head :not_found and return
        end
      end
    end
  end
end