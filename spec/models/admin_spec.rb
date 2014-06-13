require 'spec_helper'

shared_examples "attribute" do |inst, name|
  describe name do
    context 'in the attributes' do
      expect(inst.attributes).to include(:"#{name}")
    end

    context 'as a method' do
      expect(inst.send(name)).not_to raise_error
    end
  end
end

describe Admin do

	describe 'Priviledges' do
		describe 'Delete User' do
			pending ''
		end

		describe 'Approve Upload' do
			pending ''
		end

		describe 'Delete Upload' do
			pending ''
		end
	end

	describe 'Model' do
		before :each do
			expect(@admin1 = Admin.first || Admin.create!).not_to be_nil
		end

		after :each do
			@admin1.destroy!
		end

		it 'should not be nil' do
			expect(@admin1).not_to be_nil
		end

		it 'should have created' do
			expect(@admin.save).to be_true
		end

		it 'should save' do
			expect(@admin.save).to be_true
		end 

		it 'should save!' do
			expect(@admin.save!).to be_true
		end
=begin
		describe 'has attributes' do
      describe "id" do
        context 'in the attributes' do
          expect(@admin.attributes).to include(:id)
        end

        context 'as a method' do
          expect(@admin.send("id")).not_to raise_error
        end
      end
		end
=end
		it 'should destroy' do
			expect(@admin.destroy).to be_true
		end

		it 'should destroy!' do
			expect(@admin.destroy!).to be_true
		end
	end
end
