class Subscriptions < ActiveRecord::Migration
  # Create subscription_discounts Table
  create_table :subscription_discounts do |t|
    t.string   :name
    t.string   :code
    t.decimal  :amount,               :precision => 6, :scale => 2, :default => 0.0
    t.boolean  :percent
    t.date     :start_on
    t.date     :end_on
    t.timestamps
  end

  # Create subscription_payments Table
  create_table :subscription_payments do |t|
    t.integer  :account_id,           :limit => 11
    t.integer  :subscription_id,      :limit => 11
    t.decimal  :amount,               :precision => 10, :scale => 2, :default => 0.0
    t.string   :transaction_id
    t.boolean  :setup
    t.timestamps
  end

  # Create subscription_plans Table
  create_table :subscription_plans do |t|
    t.string   :name
    t.decimal  :amount,               :precision => 10, :scale => 2
    t.integer  :special_limit,        :limit => 11
    t.integer  :renewal_period,       :limit => 11, :default => 12
    t.decimal  :setup_amount,         :precision => 10, :scale => 2
    t.integer  :trial_period,         :limit => 11, :default => 1
    t.timestamps
  end

  # Create subscriptions Table
  create_table :subscriptions do |t|
    t.decimal  :amount,               :precision => 10, :scale => 2
    t.datetime :next_renewal_at
    t.string   :card_number
    t.string   :card_expiration
    t.string   :state,                :default => "trial"
    t.integer  :subscription_plan_id, :limit => 11
    t.integer  :account_id,           :limit => 11
    t.integer  :specials_limit,       :limit => 11
    t.integer  :renewal_period,       :limit => 11, :default => 1
    t.string   :billing_id
    t.timestamps
  end

  def self.down
    drop_table :subscription_discounts
    drop_table :subscription_payments
    drop_table :subscription_plans
    drop_table :subscriptions
  end
end


