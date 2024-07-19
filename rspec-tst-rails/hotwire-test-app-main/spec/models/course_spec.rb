# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Course, type: :model do
  context 'enums' do
    it {
      is_expected.to(
        define_enum_for(:status).with_values(
          { draft: 0, published: 1 }
        )
      )
    }
  end
end
