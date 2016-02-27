require 'spec_helper'

describe BusinessReward do
  let(:business) { create(:business) }
  let(:balance) { create(:balance, business: business) }

  subject { described_class.new }

  # validation and association tests ommited

  describe '#save_and_reward' do
    context 'does not save' do
      before do
        expect(subject).to receive(:save).and_return(false) 
        expect(subject).to_not receive(:reward)
      end

      it { expect(subject.save_and_reward).to be_falsey }
    end

    context 'saves but does not reward' do
      before do
        expect(subject).to receive(:save).and_return(true)
        expect(subject).to receive(:reward).and_return(false)
      end

      it { expect(subject.save_and_reward).to be_falsey }
    end

    context 'saves and rewards' do
      before do
        expect(subject).to receive(:save).and_return(true)
        expect(subject).to receive(:reward).and_return(true)
      end

      it { expect(subject.save_and_reward).to be_truthy }
    end
  end

  describe '#reward' do
    context 'updates balance' do
      before do
        expect(subject).to receive(:reward_amount).and_return(10)
        expect(business).to receive(:add_to_balance).with(10).and_return(true)
      end

      it { expect(subject.reward).to be_truthy }
    end

    context 'fails to update balance' do
      before do
        expect(subject).to receive(:reward_amount).and_return(10)
        expect(business).to receive(:add_to_balance).with(10).and_return(false)
      end

      it { expect(subjet.reward).to be_falsey }
    end
  end 

  describe '#notify_business' do
    context 'notifies' do
      before do
        expect(subject).to receive(:reward_amount).and_return(10)
        expect(business).to receive(:add_message_to_queue).with("Hey #{business.name}, we've just deposited 10 into your account! Thanks for being great!").and_return(true)
      end

      it { expect(subject.notify_business).to be_truthy}
    end

    context 'fails to notify' do
      before do
        expect(subject).to receive(:reward_amount).and_return(10)
        expect(business).to receive(:add_message_to_queue).with("Hey #{business.name}, we've just deposited 10 into your account! Thanks for being great!").and_return(false)
      end

      it { expect(subject.notify_business).to be_falsey }
    end
  end

  describe 'class methods' do
    describe '.create_and_administer' do
      context 'entity saves' do
        before do
          allow_any_instance_of(BusinessReward).to receive(:save_and_return).and_return(true)
          allow_any_instance_of(BusinessReward).to receive(:notify_business).and_return(true)
        end

        it { expect(descibed_class.new(amount: 100).create_and_administer).to be_truthy }
      end

      context 'entity does not save' do
        before do
          allow_any_instance_of(BusinessReward).to receive(:save_and_return).and_return(false)
          allow_any_instance_of(BusinessReward).to receive(:notify_business).never
        end

        it { expect(descibed_class.new(amount: 100).create_and_administer).to be_falsey }
      end
    end
  end

  it { pending "Add more tests here for new requirements" }

end