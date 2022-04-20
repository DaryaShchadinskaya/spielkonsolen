# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DevicesController, type: :controller do
  describe 'GET #index' do
    let(:devices) { create_list :device, 10 }

    before { get :index }

    context 'required output per page' do
      it 'render to index template' do
        is_expected.to render_template :index
      end
      it 'instance variable devices include only devices' do
        expect(assigns(key :devices)).to match_array(devices)
      end
    end
  end
end
