require 'rails_helper'

RSpec.describe Recipe, type: :model do

  describe 'Associations' do
    it { should belong_to( :user) }
    it { should have_many( :favorites)}
  end
end
