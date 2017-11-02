require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
  context 'Creating a car for simulating' do
      Steps 'Creating a car' do
        Given 'I am on the landing page' do
          visit '/'
        end
        When 'I fill in the car make and model year' do
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
        end
        And 'I can submit the information' do
        click_button 'Create new car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: DeLorean')
        expect(page).to have_content('Year: 1985')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0Km/h')
      end
    end
  end
  context 'Simulating a car' do
    Steps 'Speeding up a car' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      Then "the car's speed is 0Km/h" do
        expect(page).to have_content('Speed: 0Km/h')
      end
      When "I can click the accelerate button" do
        click_button 'Accelerate'
      end
      Then 'the speed of the car should be 10Km/h higher' do
        expect(page).to have_content('Speed: 10Km/h')
      end
      When "I can click the brake button" do
        click_button 'Brake'
      end
      Then 'the speed of the car should be 7Km/h lower' do
        expect(page).to have_content('Speed: 3Km/h')
      end
    end
    Steps 'Changing the lights of a car' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      Then 'I am taken to a status page that shows whether the lights on the car are on or off. They start off.' do
        expect(page).to have_content('Lights are off.')
      end
      When "I can click the lights button" do
        click_button 'Light Switch'
      end
      Then 'The lights turn on and off.' do
        expect(page).to have_content('Lights are on.')
        click_button 'Light Switch'
        expect(page).to have_content('Lights are off.')
      end
    end
    Steps 'Using the parking brake' do
      Given 'I have created a car' do
        visit '/'
        fill_in 'make', with: 'DeLorean'
        fill_in 'model_year', with: '1985'
        click_button 'Create new car'
      end
      Then 'I am taken to a status page where parking brake should start off.' do
        expect(page).to have_content('Parking brake is off.')
      end
      When "I can change the parking brake with buttons" do
        choose 'brake_on'
        click_button 'Change Parking Brake'
      end
      Then 'The parking brake should turn on' do
        expect(page).to have_content('Parking brake is on.')
      end
      Then "The car should only accelerate if the parking brake is off" do
        expect(page).to have_content('Speed: 0Km/h')
        click_button 'Accelerate'
        expect(page).to have_content('Speed: 0Km/h')
        choose 'brake_off'
        click_button 'Change Parking Brake'
        click_button 'Accelerate'
        expect(page).to have_content('Speed: 10Km/h')
      end
      Then "The parking brake should not be able to turn on if the car is moving." do
        choose 'brake_on'
        click_button 'Change Parking Brake'
        expect(page).to have_content('Parking brake is off.')
      end
    end
  # Steps 'Changing the color' do
  #   Given 'I have created a car with a color' do
  #     visit '/'
  #     fill_in 'make', with: 'DeLorean'
  #     fill_in 'model_year', with: '1985'
  #     click_button 'Create new car'
  #   end
  # end

end
