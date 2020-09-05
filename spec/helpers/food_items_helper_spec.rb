# frozen_string_literal: true

require "rails_helper"

RSpec.describe FoodItemsHelper, type: :helper do
  describe "#format_units" do
    context "when the unit type is pounds" do
      context "when the weight is less than 4 pounds" do
        it "returns the weight in ounces" do
          expect(format_units(0.5, "pounds")).to eq("8 ounces")
          expect(format_units(2.5, "pounds")).to eq("40 ounces")
          expect(format_units(3.75, "pounds")).to eq("60 ounces")
          expect(format_units(3.333, "pounds")).to eq("53.33 ounces")
        end

        context "when the weight is a whole number" do
          it "returns the weight as a whole number" do
            expect(format_units(1, "pounds")).to eq("1 pound")
            expect(format_units(2, "pounds")).to eq("2 pounds")
            expect(format_units(3, "pounds")).to eq("3 pounds")
          end
        end
      end

      context "when the weight is greater than or equal to 4 pounds" do
        it "returns the weight in pounds" do
          expect(format_units(4, "pounds")).to eq("4 pounds")
          expect(format_units(45, "pounds")).to eq("45 pounds")
          expect(format_units(5.25, "pounds")).to eq("5.25 pounds")
          expect(format_units(12.3921, "pounds")).to eq("12.39 pounds")
        end
      end
    end

    context "when the unit type is servings" do
      it "returns servings" do
        expect(format_units(10, "servings")).to eq("10 servings")
      end

      it "returns singular servings" do
        expect(format_units(1, "servings")).to eq("1 serving")
      end
    end

    context "when the unit type is quantity" do
      it "returns units" do
        expect(format_units(10, "quantity")).to eq("10 units")
      end

      it "returns singular units" do
        expect(format_units(1, "quantity")).to eq("1 unit")
      end
    end
  end
end
