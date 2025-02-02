/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000775089839_3224323566_init();
    work_m_00000000000442735274_0223978415_init();
    work_m_00000000001788690242_1621229167_init();
    work_m_00000000004094437976_3298408361_init();
    work_m_00000000004247942747_3932694078_init();
    work_m_00000000004085461342_1273971238_init();
    work_m_00000000002777173308_2058220583_init();
    work_m_00000000002275445598_3647978241_init();
    work_m_00000000001560559987_0187471498_init();
    work_m_00000000000417234031_2425904295_init();
    work_m_00000000003033503999_2420351476_init();
    work_m_00000000002788545952_0886308060_init();
    work_m_00000000004000469830_4111503280_init();
    work_m_00000000003509908363_3874298940_init();
    work_m_00000000000455236236_0626885993_init();
    work_m_00000000004247942747_4186645683_init();
    work_m_00000000001440903127_2501965158_init();
    work_m_00000000000292574286_0377518117_init();
    work_m_00000000003325700515_2625212496_init();
    work_m_00000000002280165732_3008214288_init();
    work_m_00000000003399735248_1292031434_init();
    work_m_00000000001803144382_3716499607_init();
    work_m_00000000003880166960_3877310806_init();
    work_m_00000000002047498008_0258635663_init();


    xsi_register_tops("work_m_00000000002047498008_0258635663");


    return xsi_run_simulation(argc, argv);

}
