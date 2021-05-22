----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2021 11:55:51 AM
-- Design Name: 
-- Module Name: full_processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity full_processor is
    Port (
        clock : in STD_LOGIC);
end full_processor;

architecture Behavioral of full_processor is
    -- Component declaration
    component alu port(
        inputA : in STD_LOGIC_VECTOR (63 downto 0);
        inputB : in STD_LOGIC_VECTOR (63 downto 0);
        control : in STD_LOGIC_VECTOR (3 downto 0);
        output : out STD_LOGIC_VECTOR (63 downto 0);
        zero : out STD_LOGIC);
    end component;
    
    component alu_control port(
        aluOp : in STD_LOGIC_VECTOR (1 downto 0);
        opCode : in STD_LOGIC_VECTOR (10 downto 0);
        aluControl : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
   
    component data_memory port (
        addrIn : in STD_LOGIC_VECTOR (63 downto 0);
        writeData : in STD_LOGIC_VECTOR (63 downto 0);
        memWrite : in STD_LOGIC;
        memRead : in STD_LOGIC;
        readData : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component instruction_memory port (
        instrAddr : in STD_LOGIC_VECTOR (63 downto 0);
        instrData : out STD_LOGIC_VECTOR (31 downto 0));
    end component;
    
    component main_control port ( 
        opCode : in STD_LOGIC_VECTOR (10 downto 0);
        reg2Loc : out STD_LOGIC;
        aluSrc : out STD_LOGIC;
        memToReg : out STD_LOGIC;
        regWrite : out STD_LOGIC;
        memRead : out STD_LOGIC;
        memWrite : out STD_LOGIC;
        branch : out STD_LOGIC;
        uncondBranch : out STD_LOGIC;
        aluOp : out STD_LOGIC_VECTOR (1 downto 0));
    end component;
    
    component mux port(
        muxBit : in STD_LOGIC;
        inputA : in STD_LOGIC_VECTOR (63 downto 0);
        inputB : in STD_LOGIC_VECTOR (63 downto 0);
        output : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component mux_reg port(
        muxBit : in STD_LOGIC;
        inputA : in STD_LOGIC_VECTOR (4 downto 0);
        inputB : in STD_LOGIC_VECTOR (4 downto 0);
        output : out STD_LOGIC_VECTOR (4 downto 0));
    end component;

    component program_counter port (
        clock : in STD_LOGIC;
        nextInstrAddr : in STD_LOGIC_VECTOR (63 downto 0);
        currentInstrAddr : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component register_file port (
        regSelReadA : in STD_LOGIC_VECTOR (4 downto 0);
        regSelReadB : in STD_LOGIC_VECTOR (4 downto 0);
        writeData : in STD_LOGIC_VECTOR (63 downto 0);
        regWrite : in STD_LOGIC;
        regSelWrite : in STD_LOGIC_VECTOR (4 downto 0);
        outA : out STD_LOGIC_VECTOR (63 downto 0);
        outB : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component sign_extend port (
        instruction : in STD_LOGIC_VECTOR (31 downto 0);
        output : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
    
    component shift_left_two port (
        input : in STD_LOGIC_VECTOR (63 downto 0);
        output : out STD_LOGIC_VECTOR (63 downto 0));
    end component;
        
    component instruction_breakup port (
        instruction : in STD_LOGIC_VECTOR (31 downto 0);
        opcode : out STD_LOGIC_VECTOR (10 downto 0);
        regSelReadA : out STD_LOGIC_VECTOR (4 downto 0);
        regSelReadBTop : out STD_LOGIC_VECTOR (4 downto 0);
        regSelReadBBot : out STD_LOGIC_VECTOR (4 downto 0);
        regSelWrite : out STD_LOGIC_VECTOR (4 downto 0));
    end component;
    
    --alu
    signal aluInputB: STD_LOGIC_VECTOR (63 downto 0);
    signal aluControl: STD_LOGIC_VECTOR (3 downto 0);
    signal aluOutput: STD_LOGIC_VECTOR (63 downto 0);
    signal zero: STD_LOGIC;
    
    --alu_cont
    signal aluOp : STD_LOGIC_VECTOR (1 downto 0);
    signal opcode : STD_LOGIC_VECTOR (10 downto 0);
    
    --data_mem
    signal memWrite : STD_LOGIC;
    signal memRead : STD_LOGIC;
    signal readData : STD_LOGIC_VECTOR (63 downto 0);
    
    --instr_mem
    signal instruction : STD_LOGIC_VECTOR (31 downto 0);
    
    --main_control
    signal reg2Loc : STD_LOGIC;
    signal aluSrc : STD_LOGIC;
    signal memToReg : STD_LOGIC;
    signal regWrite : STD_LOGIC;
    signal branch : STD_LOGIC;
    signal uncondBranch : STD_LOGIC;
    
    --program_count
    signal nextInstrAddr : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000000";
    signal currentInstrAddr : STD_LOGIC_VECTOR (63 downto 0):= "0000000000000000000000000000000000000000000000000000000000000000";
    
    --reg_file
    signal regSelReadA : STD_LOGIC_VECTOR (4 downto 0);
    signal regSelReadB : STD_LOGIC_VECTOR (4 downto 0);
    signal regSelReadBTop : STD_LOGIC_VECTOR (4 downto 0);
    signal regSelReadBBot : STD_LOGIC_VECTOR (4 downto 0);
    signal regSelWrite : STD_LOGIC_VECTOR (4 downto 0);
    signal regWriteData : STD_LOGIC_VECTOR (63 downto 0);
    signal regOutA : STD_LOGIC_VECTOR (63 downto 0);
    signal regOutB : STD_LOGIC_VECTOR (63 downto 0);
    
    --sign_extend
    signal signOutput : STD_LOGIC_VECTOR (63 downto 0);
    
    --shift left
    signal shiftOutput: STD_LOGIC_VECTOR (63 downto 0);
    
    --alu for pc
    signal instrAddr : STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    constant plusFour: STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    constant aluAdd: STD_LOGIC_VECTOR (3 downto 0) := "0010"; 
    signal addrPlusFour: STD_LOGIC_VECTOR (63 downto 0) := "0000000000000000000000000000000000000000000000000000000000000100";
    
    --alu for b
    signal branchAddr: STD_LOGIC_VECTOR (63 downto 0);
    
begin
    main_control_0: main_control port map(
        opCode => instruction(31 downto 21),
        reg2Loc => reg2Loc,
        aluSrc => aluSrc,
        memToReg => memToReg,
        regWrite => regWrite,
        memRead => memRead,
        memWrite => memWrite,
        branch => branch,
        uncondBranch => uncondBranch,
        aluOp => aluOp);
    alu_0: alu port map(
        inputA => regOutA,
        inputB => aluInputB,
        control => aluControl,
        output => aluOutput,
        zero => zero);
    alu_pc: alu port map(
        inputA => instrAddr,
        inputB => plusFour,
        control => aluAdd,
        output => addrPlusFour);
    alu_b: alu port map(
        inputA => currentInstrAddr,
        inputB => shiftOutput,
        control => aluAdd,
        output => branchAddr);
    alu_control_0: alu_control port map(
        aluOp => aluOp,
        opCode => opcode,
        aluControl => aluControl);
    data_memory_0: data_memory port map(
        addrIn => aluOutput,
        writeData => regOutB,
        memWrite => memWrite,
        memRead => memRead,
        readData => readData);
    instruction_memory_0: instruction_memory port map(
        instrAddr => currentInstrAddr,
        instrData => instruction);
    program_counter_0: program_counter port map(
        clock => clock,
        nextInstrAddr => nextInstrAddr,
        currentInstrAddr => currentInstrAddr);
    sign_extend_0: sign_extend port map(
        instruction => instruction,
        output => signOutput);
    shift_left_two_0: shift_left_two port map(
        input => signOutput,
        output => shiftOutput);
    mux_reg_0: mux_reg port map(
        muxBit => reg2Loc,
        inputA => regSelReadBTop,
        inputB => regSelReadBBot,
        output => regSelReadB);
    mux_alu: mux port map(
        muxBit => aluSrc,
        inputA => regOutB,
        inputB => signOutput,
        output => aluInputB);
    mux_mem: mux port map(
        muxBit => memToReg,
        inputA => aluOutput,
        inputB => readData,
        output => regWriteData);
    register_file_0: register_file port map(
        regSelReadA => regSelReadA,
        regSelReadB => regSelReadB,
        regSelWrite => regSelWrite,
        writeData => regWriteData,
        regWrite => regWrite,
        outA => regOutA,
        outB => regOutB);
    instruction_break_0: instruction_breakup port map(
        instruction => instruction,
        opcode => opcode,
        regSelReadA => regSelReadA,
        regSelReadBTop => regSelReadBTop,
        regSelReadBBot => regSelReadBBot,
        regSelWrite => regSelWrite);
    
    process
    begin
        instrAddr <= currentInstrAddr;
        
        wait for 1ps;
        if uncondBranch = '1' OR (branch = '1' AND zero = '1') then
            nextInstrAddr <= branchAddr;
        else
            nextInstrAddr <= addrPlusFour;    
        end if;
        
    end process;
end Behavioral;
