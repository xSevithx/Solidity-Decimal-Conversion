interface IERC20 {
    function decimals() external view returns (uint8);
}

contract DecimalsTest {
    
    function changeDecimals(address _fromToken, address _toToken, uint _amount) external view returns (uint) {
        return convertDecimals(_amount, getDecimals(_fromToken), getDecimals(_toToken));
    }

    function getDecimals(address _token) internal view returns (uint8) {
        return IERC20(_token).decimals();
    }

    function convertDecimals(uint _tokenAmount, uint8 _token1decimals, uint8 _token2decimals) internal pure returns (uint) {
        if (_token1decimals > _token2decimals)
            return _tokenAmount / (10**(_token1decimals - _token2decimals));
        else
            return _tokenAmount * (10**(_token2decimals - _token1decimals));
    }

}
