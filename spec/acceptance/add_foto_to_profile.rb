=begin
feature 'Add files to question', %q{
  In order to illustrate my question 
  As a question's author
  I'd like to be able to attach files
} do 
  let!(:admin_user){ create :user }
  let(:user){ create(:user) }

  background do
    sign_in user    
  end

  scenario 'User adds file when asks question', js: true do    
    attach_file "File", "#{ Rails.root }/spec/spec_helper.rb"
    click_on "Create"
    expect(page).to have_link "spec_helper.rb", href:"/uploads/attachment/file/1/spec_helper.rb"
  end  

  scenario "blank fields are not treated as file", js: true do
    click_on "add file"
    click_on "add file"
    wait_for_ajax
    files = page.all("input[type='file']")
    files[0].set("#{ Rails.root }/spec/spec_helper.rb")
    files[2].set("#{ Rails.root }/spec/rails_helper.rb")
    click_on "Create"    
    expect(page).to have_link "spec_helper.rb", href:"/uploads/attachment/file/1/spec_helper.rb"
    expect(page).to have_link "rails_helper.rb", href:"/uploads/attachment/file/2/rails_helper.rb"
  end

  scenario "Can remove files on creating a question", js: true do
    click_on "add file"    
    wait_for_ajax
    files = page.all("input[type='file']")
    files[0].set("#{ Rails.root }/spec/spec_helper.rb")
    files[1].set("#{ Rails.root }/spec/rails_helper.rb")
    first(".nested-fields").click_on "remove file"
    click_on "Create"
    expect(page).to_not have_link "spec_helper.rb", href:"/uploads/attachment/file/1/spec_helper.rb"
    expect(page).to have_link "rails_helper.rb", href:"/uploads/attachment/file/1/rails_helper.rb"
  end
end
=end
