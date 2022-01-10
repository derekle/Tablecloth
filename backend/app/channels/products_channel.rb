class ProductsChannel < ApplicationCable::Channel
  def subscribed
    @store = Store.find_by(id: params[:store])
    stream_for @store
  end

  def received(data)
    ProductChannel.broadcast_to(@store, {store: @store, products: @store.products})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
