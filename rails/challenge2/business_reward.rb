class BusinessReward < ActiveRecord::Base

  belongs_to :business

  validates :business_id, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  def save_and_reward
    save && reward
  end

  # Business#add_to_balance will increase the balance's amount by whatever is passed in. It will return true if the adjustment succeeds and false otherwise
  def reward
    business.add_to_balance(amount)
  end

  # Business#add_message_to_queue pushes a string to a business' notification queue. It will return true if the message is successfully pushed to the queue, and false otherwise.
  def notify_business
    business.add_message_to_queue("Hey #{business.name}, we've just deposited #{amount} into your account! Thanks for being great!")
  end

  class << self
    def create_and_administer(business:, amount:)
      entity = new(business: business, mount: amount)
      if entity.save_and_reward
        entity.notify_business
      end
  end
end