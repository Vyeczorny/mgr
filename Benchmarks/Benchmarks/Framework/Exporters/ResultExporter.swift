//
// Created by Karol on 21.08.2018.
// Copyright (c) 2018 Karol Wieczorek. All rights reserved.
//

import Foundation

class ResultExporter {
    func export(testSuiteResult: TestSuiteResult, runningOptions: RunningOptions) {
        switch runningOptions.export {
            case .terminal:
                TerminalExporter().export(testSuiteResult: testSuiteResult)
            case .gnuplot:
                GnuplotExporter(runningOptions: runningOptions).export(testSuiteResult: testSuiteResult)
            case .mGnuplot:
                MultipleGnuplotExporter().export(testSuiteResult: testSuiteResult)
        }
    }
}