module ControllerMacros
  def sign_in_user
    before do 
      @user = create(:user)
      @request.env['devise.mappimg'] = Devise.mappings[:user]
      sign_in @user
    end
  end
end