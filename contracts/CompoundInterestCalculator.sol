// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CompoundInterestCalculator {
    // Function to calculate compound interest
    function calculateCompoundInterest(
        uint256 depositPerMonth,
        uint256 interestRatePerYear,
        uint256 totalYears
    ) public pure returns (uint256) {
        uint256 totalMonths = totalYears * 12;
        uint256 totalInvestment = 0;
        uint256 monthlyInterestRate = (interestRatePerYear * 1e18) / (100 * 12);

        for (uint256 i = 0; i < totalMonths; i++) {
            totalInvestment += depositPerMonth;
            uint256 monthlyInterest = (totalInvestment * monthlyInterestRate) / 1e18;
            totalInvestment += monthlyInterest;
        }

        return totalInvestment;
    }

    // Function to get profit (total investment minus total deposits)
    function getProfit(
        uint256 depositPerMonth,
        uint256 interestRatePerYear,
        uint256 totalYears
    ) public pure returns (uint256) {
        uint256 totalInvestment = calculateCompoundInterest(depositPerMonth, interestRatePerYear, totalYears);
        uint256 totalDeposits = depositPerMonth * totalYears * 12;
        return totalInvestment - totalDeposits;
    }
}