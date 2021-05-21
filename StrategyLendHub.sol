// SPDX-License-Identifier: MIT
// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


pragma solidity ^0.6.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `recipient`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `sender` to `recipient` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);

    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);
}

// File: @openzeppelin/contracts/math/SafeMath.sol


pragma solidity ^0.6.0;

/**
 * @dev Wrappers over Solidity's arithmetic operations with added overflow
 * checks.
 *
 * Arithmetic operations in Solidity wrap on overflow. This can easily result
 * in bugs, because programmers usually assume that an overflow raises an
 * error, which is the standard behavior in high level programming languages.
 * `SafeMath` restores this intuition by reverting the transaction when an
 * operation overflows.
 *
 * Using this library instead of the unchecked operations eliminates an entire
 * class of bugs, so it's recommended to use it always.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a, "SafeMath: addition overflow");

        return c;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return sub(a, b, "SafeMath: subtraction overflow");
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b <= a, errorMessage);
        uint256 c = a - b;

        return c;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
        if (a == 0) {
            return 0;
        }

        uint256 c = a * b;
        require(c / a == b, "SafeMath: multiplication overflow");

        return c;
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return div(a, b, "SafeMath: division by zero");
    }

    /**
     * @dev Returns the integer division of two unsigned integers. Reverts with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b > 0, errorMessage);
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold

        return c;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return mod(a, b, "SafeMath: modulo by zero");
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * Reverts with custom message when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b, string memory errorMessage) internal pure returns (uint256) {
        require(b != 0, errorMessage);
        return a % b;
    }
}

// File: contracts/earn/interfaces/yearn/IController.sol

pragma solidity >=0.6.12;

interface IController {
    function withdraw(address, uint256) external;

    function balanceOf(address) external view returns (uint256);

    function earn(address, uint256) external;

    function want(address) external view returns (address);

    function rewards() external view returns (address);

    function vaults(address) external view returns (address);

    function strategies(address) external view returns (address);

    function approvedStrategies(address, address) external view returns (bool);
}

// File: contracts/earn/interfaces/compound/Token.sol

pragma solidity ^0.6.12;

interface cToken {
    function mint(uint256 mintAmount) external returns (uint256);

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function exchangeRateStored() external view returns (uint256);

    function balanceOf(address _owner) external view returns (uint256);

    function underlying() external view returns (address);

    function getAccountSnapshot(address account)
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        );
}

// File: contracts/earn/interfaces/compound/CETH.sol

pragma solidity ^0.6.12;

interface CETH {
    function mint() external payable;

    function redeem(uint256 redeemTokens) external returns (uint256);

    function redeemUnderlying(uint256 redeemAmount) external returns (uint256);

    function borrow(uint256 borrowAmount) external returns (uint256);

    function repayBorrow(uint256 repayAmount) external returns (uint256);

    function getAccountSnapshot(address account)
        external
        view
        returns (
            uint256,
            uint256,
            uint256,
            uint256
        );
}

// File: contracts/earn/interfaces/compound/IUnitroller.sol

pragma solidity ^0.6.12;

interface IUnitroller {
    function claimComp(address holder, address[] calldata cTokens) external;

    function claimCan(address holder, address[] calldata cTokens) external;
}

// File: contracts/earn/interfaces/uniswap/Uni.sol

pragma solidity ^0.6.12;

interface Uni {
    function swapExactTokensForTokens(
        uint256,
        uint256,
        address[] calldata,
        address,
        uint256
    ) external;

    function getAmountsOut(uint256 amountIn, address[] memory path) external view returns (uint256[] memory amounts);
}

// File: contracts/earn/interfaces/weth/WETH.sol

pragma solidity ^0.6.12;

interface IWETH {
    function deposit() external payable;

    function transfer(address to, uint256 value) external returns (bool);

    function withdraw(uint256 wad) external;

    event Deposit(address indexed dst, uint256 wad);
    event Withdrawal(address indexed src, uint256 wad);
}

// File: contracts/earn/strategies/StrategyCommon.sol

pragma solidity >=0.6.12;









interface ISwapMining {
    function takerWithdraw() external;
}

contract StrategyCommon {
    using SafeMath for uint256;

    /// @notice WHT地址
    address public constant WHT = 0x5545153CCFcA01fbd7Dd11C0b23ba694D9509A6F;
    /// @notice USDT地址
    address public constant USDT = 0xa71EdC38d189767582C38A3145b5873052c3e47a;

    /// @notice MDEX路由地址
    address public constant uniRouter = 0xED7d5F38C79115ca12fe6C0041abb22F0A06C300;

    /// @notice MDX SwapMining 地址
    address public constant SwapMining = 0x7373c42502874C88954bDd6D50b53061F018422e;
    /// @notice MDX 地址
    address public constant MDX = 0x25D2e80cB6B86881Fd7e07dd263Fb79f4AbE033c;
    /// @notice keepr机器人
    address public keeper;

    /// @notice 5%的管理费 450 / 10000
    uint256 public strategistReward = 450;
    /// @notice 收获奖励
    uint256 public harvestReward = 50;
    /// @notice 取款费
    uint256 public withdrawalFee = 50;
    /// @notice 各项费率基准值
    uint256 public constant FEE_DENOMINATOR = 10000;

    /// @notice ctoken地址
    address public immutable ctoken;
    /// @notice want地址
    address public immutable want;

    address public governance;
    address public controller;
    address public strategist;

    /// @notice comp控制器地址
    address public immutable comptrl;
    /// @notice comp代币地址
    address public immutable comp;

    /**
     * @dev 构造函数
     */
    constructor(
        address _controller,
        address _ctoken,
        address _want,
        address _comptrl,
        address _comp
    ) public {
        governance = msg.sender;
        strategist = msg.sender;
        controller = _controller;
        ctoken = _ctoken;
        want = _want;
        comptrl = _comptrl;
        comp = _comp;
    }

    /// @dev 确认调用者不能是除了治理和策略员以外的其他合约
    modifier onlyBenevolent {
        require(msg.sender == tx.origin || msg.sender == governance || msg.sender == strategist || msg.sender == keeper);
        _;
    }

    /**
     * @dev 设置策略员地址
     * @param _strategist 策略员地址
     * @notice 只能由治理地址设置
     */
    function setStrategist(address _strategist) external {
        require(msg.sender == governance || msg.sender == strategist, "!authorized");
        strategist = _strategist;
    }

    /**
     * @dev 设置提现手续费
     * @param _withdrawalFee 提现手续费
     * @notice 只能由治理地址设置
     */
    function setWithdrawalFee(uint256 _withdrawalFee) external {
        require(msg.sender == governance, "!governance");
        withdrawalFee = _withdrawalFee;
    }

    /**
     * @dev 设置策略奖励
     * @param _strategistReward 奖励
     * @notice 只能由治理地址设置
     */
    function setStrategistReward(uint256 _strategistReward) external {
        require(msg.sender == governance, "!governance");
        strategistReward = _strategistReward;
    }

    /**
     * @dev 设置收获奖励
     * @param _harvestReward 奖励
     * @notice 只能由治理地址设置
     */
    function setHarvestReward(uint256 _harvestReward) external {
        require(msg.sender == governance, "!governance");
        harvestReward = _harvestReward;
    }

    /**
     * @dev 设置守护机器人
     * @param _keeper 机器人地址
     * @notice 只能由治理地址设置
     */
    function setKeeper(address _keeper) external {
        require(msg.sender == governance, "!governance");
        keeper = _keeper;
    }

    ///@notice 设置治理账户地址
    function setGovernance(address _governance) external {
        require(msg.sender == governance, "!governance");
        governance = _governance;
    }

    ///@notice 设置控制器合约地址
    function setController(address _controller) external {
        require(msg.sender == governance, "!governance");
        controller = _controller;
    }

    ///@notice 返回当前合约的 want 余额
    ///@return want 余额
    function balanceOfWant() public view returns (uint256) {
        return IERC20(want).balanceOf(address(this));
    }

    ///@notice 返回当前合约的在存款池中的余额
    ///@return ctoken 中的余额
    function balanceOfPool() public view returns (uint256) {
        (, uint256 cTokenBal, , uint256 exchangeRate) = cToken(ctoken).getAccountSnapshot(address(this));
        return cTokenBal.mul(exchangeRate).div(1e18);
    }

    ///@notice 本策略管理的总want数额
    function balanceOf() public view returns (uint256) {
        return balanceOfWant().add(balanceOfPool());
    }

    /// @dev MDX交易即挖矿
    function _doSwapMining() internal {
        // 从MDX交易即挖矿提取MDX
        ISwapMining(SwapMining).takerWithdraw();
        // mdx余额
        uint256 mdxBalance = IERC20(MDX).balanceOf(address(this));
        // 如果mdx余额>0
        if (mdxBalance > 0) {
            // 用MDX交换USDT
            _swap(uniRouter, MDX, USDT, mdxBalance);
        }
    }

    /// @dev 发送复利奖励
    function _doReward() internal {
        // 如果当前合约的USDT余额
        uint256 usdtBalance = IERC20(USDT).balanceOf(address(this));
        // 如果当前合约的USDT余额>0
        if (usdtBalance > 0) {
            // 所有奖励数量 = USDT余额 * (触发奖励+策略奖励) / 10000
            uint256 _USDTReward = usdtBalance.mul(strategistReward.add(harvestReward)).div(FEE_DENOMINATOR);
            // 策略奖励 = 奖励数量 * 策略奖励比例 / (触发奖励+策略奖励)
            uint256 _strategistReward = _USDTReward.mul(strategistReward).div(strategistReward.add(harvestReward));
            // 触发harvest的奖励 = 奖励数量 * 触发奖励比例 / (触发奖励+策略奖励)
            uint256 _harvestReward = _USDTReward.mul(harvestReward).div(strategistReward.add(harvestReward));
            // 将奖励发给策略员
            IERC20(USDT).transfer(strategist, _strategistReward);
            // 发送触发奖励
            IERC20(USDT).transfer(msg.sender, _harvestReward);
        }
    }

    /// @dev 购买本币
    function _buyWant() internal {
        // 如果want不是USDT,并且当前合约的USDT余额>0
        if (want != USDT && IERC20(USDT).balanceOf(address(this)) > 0) {
            // 用USDT交换want
            _swap(uniRouter, USDT, want, IERC20(USDT).balanceOf(address(this)));
        }
    }

    /// @dev 交换
    function _swap(
        address router,
        address tokenIn,
        address tokenOut,
        uint256 amountIn
    ) internal {
        // 将tokenIn批准给路由合约无限数量
        IERC20(tokenIn).approve(router, 0);
        IERC20(tokenIn).approve(router, uint256(-1));
        // 交易路径 USDT=>want
        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;
        // 调用路由合约用tokenIn交换tokenOut
        Uni(router).swapExactTokensForTokens(amountIn, uint256(0), path, address(this), block.timestamp.add(1800));
    }

    /**
     * @dev 存款方法
     * @notice 将want发送到ctoken,如果是wht就发送到ceth
     */
    function deposit() public {
        // _want余额 = 当前合约在_want合约中的余额
        uint256 _want = IERC20(want).balanceOf(address(this));
        // 如果_want余额 > 0
        if (_want > 0) {
            // 如果want地址==WHT地址
            if (want == WHT) {
                // 从WHT合约取款WHT
                IWETH(WHT).withdraw(_want);
                // 当前合约的HT余额
                uint256 balance = address(this).balance;
                // 如果HT余额>0
                if (balance > 0) {
                    // 调用ctoken的铸造方法铸造_want数量的ctoken
                    CETH(ctoken).mint{value: balance}();
                }
            } else {
                // 将_want余额数量的want批准给ctoken地址
                IERC20(want).approve(ctoken, 0);
                IERC20(want).approve(ctoken, _want);
                // 调用ctoken的铸造方法铸造_want数量的ctoken,并确认返回0
                require(cToken(ctoken).mint(_want) == 0, "deposit fail");
            }
        }
    }

    /**
     * @notice 将当前合约在'_asset'资产合约的余额'balance'发送给控制器合约
     * @dev 提款方法
     * @param _asset 资产地址
     * @return balance 当前合约在资产合约中的余额
     * 控制器仅用于从灰尘中产生额外奖励的功能
     */
    // Controller only function for creating additional rewards from dust
    function withdraw(IERC20 _asset) public virtual returns (uint256 balance) {
        // 只允许控制器合约调用
        require(msg.sender == controller, "!controller");
        // 资产地址不能等于want地址
        require(want != address(_asset), "want");
        // 资产地址不能等于ctoken地址
        require(ctoken != address(_asset), "want");
        // 资产地址不能等于comp地址
        require(comp != address(_asset), "want");
        // 当前合约在资产合约中的余额
        balance = _asset.balanceOf(address(this));
        // 将资产合约的余额发送给控制器合约
        _asset.transfer(controller, balance);
    }

    /**
     * @notice 将当前合约的want发送‘_amount’数额给控制器合约的保险库
     * @dev 提款方法
     * @param _amount 提现数额
     * 提取部分资金，通常用于金库提取
     */
    // Withdraw partial funds, normally used with a vault withdrawal
    function withdraw(uint256 _amount) external {
        // 只允许控制器合约调用
        require(msg.sender == controller, "!controller");
        // 当前合约的want余额
        uint256 _balance = IERC20(want).balanceOf(address(this));
        //如果 余额 < 提现数额
        if (_balance < _amount) {
            // 数额 = 赎回资产（数额 - 余额）
            _amount = _withdrawSome(_amount.sub(_balance));
            // 数额 += 余额
            _amount = _amount.add(_balance);
        }

        // 提现手续费
        uint256 _fee = _amount.mul(withdrawalFee).div(FEE_DENOMINATOR);
        // 如果手续费>0
        if (_fee > 0) {
            // 将手续费发送到控制器奖励地址
            IERC20(want).transfer(IController(controller).rewards(), _fee);
        }
        // 保险库 = want合约在控制器的保险库地址
        address _vault = IController(controller).vaults(address(want));
        // 确保保险库地址不为空
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        // 将want 发送到 保险库
        IERC20(want).transfer(_vault, _amount.sub(_fee));
    }

    /**
     * @notice 根据当前合约在dusdt的余额计算出可以在dusdt中赎回的数额,并赎回资产
     * @dev 内部赎回资产方法
     * @param _amount 数额
     * @return _withdrew 赎回数额
     */
    function _withdrawSome(uint256 _amount) internal returns (uint256) {
        // 之前 = 当前合约的want余额
        uint256 before = IERC20(want).balanceOf(address(this));
        // 如果want地址==WHT地址
        if (want == WHT) {
            // 确认成功调用CETH合约的赎回底层资产方法,数量为_amount
            require(CETH(ctoken).redeemUnderlying(_amount) == 0, "redeem fail");
            // 当前合约的HT余额
            uint256 balance = address(this).balance;
            // 如果HT余额大于0
            if (balance > 0) {
                // 向WHT合约存款
                IWETH(want).deposit{value: balance}();
            }
        } else {
            // 确认成功调用CToken合约的赎回底层资产方法,数量为_amount
            require(cToken(ctoken).redeemUnderlying(_amount) == 0, "redeem fail");
        }
        // 返回当前合约在want合约的余额 - 之前的数量
        return IERC20(want).balanceOf(address(this)).sub(before);
    }

    /**
     * @notice 将当前合约的USDT全部发送给控制器合约的保险库
     * @dev 提款全部方法
     * @return balance 当前合约的USDT余额
     * 提取所有资金，通常在迁移策略时使用
     */
    // Withdraw all funds, normally used when migrating strategies
    function withdrawAll() external returns (uint256 balance) {
        // 只允许控制器合约调用
        require(msg.sender == controller, "!controller");
        //调用内部全部提款方法
        _withdrawAll();

        //当前合约的want余额
        balance = IERC20(want).balanceOf(address(this));

        //保险库 = want合约在控制器的保险库地址
        address _vault = IController(controller).vaults(address(want));
        //确保保险库地址不为空
        require(_vault != address(0), "!vault"); // additional protection so we don't burn the funds
        //将want余额全部发送到保险库中
        IERC20(want).transfer(_vault, balance);
    }

    /// @dev 提款全部方法
    function _withdrawAll() internal {
        // 调用内部赎回资产方法
        _withdrawSome(balanceOfPool());
    }

    /// @dev 虚构卖掉comp方法
    function _sellComp() internal virtual {
        // 当前合约在comp代币的数量
        uint256 _comp = IERC20(comp).balanceOf(address(this));
        // 如果comp数量>0
        if (_comp > 0) {
            // 用comp交换USDT
            _swap(uniRouter, comp, USDT, _comp);
        }
    }

    /// @dev 收获方法
    function harvest() public onlyBenevolent {
        // 之前 = 当前合约在want的数量
        uint256 before = IERC20(want).balanceOf(address(this));
        // 卖掉comp
        _sellComp();
        // MDX交易即挖矿
        _doSwapMining();
        // 发送复利奖励
        _doReward();
        // 购买本币
        _buyWant();
        // 获得的数量 = 当前合约在want的余额 - 之前的数量
        uint256 gain = IERC20(want).balanceOf(address(this)).sub(before);
        // 如果获得的数量>0
        if (gain > 0) {
            // 存款
            deposit();
        }
    }
}

// File: contracts/earn/strategies/StrategyLendHub.sol

pragma solidity >=0.6.12;
pragma experimental ABIEncoderV2;


contract StrategyLendHub is StrategyCommon {
    /// @dev comp控制器地址
    address _comptrl = 0x6537d6307ca40231939985BCF7D83096Dd1B4C09;
    /// @dev comp代币地址
    address _comp = 0x8F67854497218043E1f72908FFE38D0Ed7F24721;

    /**
     * @dev 构造函数
     * @param _controller 控制器地址
     * @param _ctoken CToken地址
     * @param _want want地址
     */
    constructor(
        address _controller,
        address _ctoken,
        address _want
    ) public StrategyCommon(_controller, _ctoken, _want, _comptrl, _comp) {}

    /// @dev 卖掉comp
    function _sellComp() internal override {
        // 市场数组
        address[] memory markets = new address[](1);
        // 数组唯一值为ctoken
        markets[0] = ctoken;
        // 调用comp的控制器,取出comp代币
        IUnitroller(comptrl).claimComp(address(this), markets);
        super._sellComp();
    }

    receive() external payable {}
}
