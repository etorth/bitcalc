/*
 * =====================================================================================
 *
 *       Filename: main.cpp
 *        Created: 11/03/2017 20:51:28
 *  Last Modified: 11/03/2017 21:34:02
 *
 *    Description: 
 *
 *        Version: 1.0
 *       Revision: none
 *       Compiler: gcc
 *
 *         Author: ANHONG
 *          Email: anhonghe@gmail.com
 *   Organization: USTC
 *
 * =====================================================================================
 */
#include "bitcalcwindow.hpp"

BitCalcWindow *g_BitCalcWindow = nullptr;

int main(int argc, char *argv[])
{
    g_BitCalcWindow = new BitCalcWindow();
    g_BitCalcWindow->ShowAll();
    return Fl::run();
}
