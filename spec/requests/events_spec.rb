require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /index" do
    before { Event.create!({ title: 'Looking at Eggleston I', start_date: '22 Feb 2023', end_date: '22 Feb 2023', web_source: 'Co Berlin' }) }

    it 'returns a 200 response' do
      get events_path
      expect(response).to have_http_status(:ok)
    end

    it 'verifies specific Event data is present in the response body' do
      get events_path
      expect(response.body).to include('<td>Looking at Eggleston I</td>')
      expect(response.body).to include('<td>2023-02-22</td>')
      expect(response.body).to include('<td>2023-02-22</td>')
      expect(response.body).to include('<td>Co Berlin</td>')
    end

    context 'when providing params for filtering' do
      it 'verifies the second Event title, start date, end date and web source is not present in the response body' do
        Event.create!({ title: 'Festival 1', start_date: '20 Mar 2023', end_date: '30 Mar 2023', web_source: 'Berghain' })
        get events_path, params: query_params
        expect(response.body).not_to include('<td>Festival 1</td>')
        expect(response.body).not_to include('<td>2023-03-20</td>')
        expect(response.body).not_to include('<td>2023-03-30</td>')
        expect(response.body).not_to include('<td>Berghain</td>')
      end

      def query_params
        {
          'query' => {
            'title_i_cont' => 'Looking at Eggleston I',
            'start_date_gteq' => '2023-02-22',
            'end_date_lteq' => '2023-02-22',
            'web_source_i_cont' => 'co berlin'
          }
        }
      end
    end
  end
end
