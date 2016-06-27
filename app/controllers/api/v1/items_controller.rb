module API
  module V1
    class ItemsController < ApplicationController
      before_action :set_bucketlist

      def show
        @bucketlist.items.find_by!(id: params[:id])
        json_response(@bucketlist)
      end

      def index
        json_response(@bucketlist.items)
      end

      def create
        @bucketlist.items.create!(item_params)
        json_response(@bucketlist, :created)
      end

      def update
        item = @bucketlist.items.find_by!(id: params[:id])
        item.update!(item_params)
        json_response(@bucketlist)
      end

      private

      def set_bucketlist
        @bucketlist = Bucketlist.find_by!(id: params[:bucketlist_id])
      end

      def item_params
        params.permit(:name, :done)
      end
    end
  end
end
