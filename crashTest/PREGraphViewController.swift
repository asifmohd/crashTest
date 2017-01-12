//
//  PREGraphViewController.swift
//  PractoBusiness
//
//  Created by Pramod M on 24/04/16.
//  Copyright © 2016 Practo Technologies Private Limited. All rights reserved.
//

import UIKit
import Charts

class ABCD: UIViewController {

//    @IBOutlet weak var zoneKeywordLabel: UILabel!
//    @IBOutlet weak var chartView: BarChartView!
//    @IBOutlet weak var withReachLeadsLabel: UILabel!
//    @IBOutlet weak var withoutReachLeadsLabel: UILabel!
//    @IBOutlet weak var scrollView: UIScrollView!
//
//    @IBOutlet weak var noOrganicImpressionsView: UIView!
//    @IBOutlet weak var organicAndReacView: UIView!
//    @IBOutlet weak var onlyReachLabel: UILabel!
//    @IBOutlet weak var onlyReachLegendView: UIView!
//    @IBOutlet weak var organicReachLegendView: UIView!

//    lazy var activityIndicator: PractoActivityIndicator = Utils.getActivityIndicator(self.view)

//    let kRestOfTheViewHeight: CGFloat = 50 + 40 + 75;   // Cumulative height of the other views except graph view
//
//    var practiceName: String = ""
//    var practiceLocation: String = ""
//    var subscriptionZone: String = ""
//    var subscriptionKeyword: String = ""
//    var subscriptionId: String = ""
//    var practiceId: String = ""
//
//    var isFromHomeFeed: Bool = false

//    let reachImpressions = PREImpressions.init()

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        setupView()
//        prepareChartView()
//        loadData()
//        // Do any additional setup after loading the view.
//    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
////        EventsManager.sharedInstance.track("reach_subscriptions__view", properties: ["subscription_id": subscriptionId], tracker: EventsManager.Tracker.MixPanel)
//
//        if (self.chartView.frame).maxY + kRestOfTheViewHeight > (self.view.frame).height {
//            self.scrollView.isScrollEnabled = true
//        } else {
//            self.scrollView.isScrollEnabled = false
//        }
//    }

//    func setupView() {
//        if isFromHomeFeed == true {
//            let cancelButton = UIBarButtonItem(image: UIImage(named: "backChevron"), style: UIBarButtonItemStyle.done, target: self, action: #selector(self.dismissSelf))
//            cancelButton.tintColor = PractoConstants.Color.kCharcoal
//            Utils.addBarButtonsToNavigationBar(inVC: self, leftBarButtonItems: [cancelButton], rightBarButtonItems: [])
//        }
//        navigationController?.navigationBar.tintColor = PractoConstants.Color.kCharcoal
//        Utils.setNavigationBarTitleView(inVC: self, title: practiceName, subTitle: practiceLocation)
//        self.zoneKeywordLabel.text = "\(subscriptionZone), \(subscriptionKeyword)"
//        Utils.addChronosButtonOnNavBar(inVC: self)
//    }

//    func prepareChartView() {
//        chartView.descriptionText = ""
//        chartView.maxVisibleValueCount = 0
//        chartView.pinchZoomEnabled = false
//        chartView.doubleTapToZoomEnabled = false
//        chartView.drawGridBackgroundEnabled = false
//        chartView.drawBarShadowEnabled = false
//        chartView.drawValueAboveBarEnabled = false
//        chartView.animate(yAxisDuration: 1)
//        chartView.delegate = self
//        chartView.dragEnabled = true
//
//
//        let legend: ChartLegend = chartView.legend
//        legend.enabled = false
//
//        let marker: PREBalloonMarker = PREBalloonMarker.init(color: PractoConstants.Color.kBalloonMarkerColor, font: UIFont.systemFont(ofSize: 12), insets: UIEdgeInsets.init(top: 5, left: 5, bottom: 5, right: 5))
//        marker.minimumSize = CGSize(width: 50.0, height: 40.0)
//        chartView.marker = marker
//
//        let leftAxis: ChartYAxis = chartView.leftAxis
//        leftAxis.axisLineColor = UIColor.lightGray.withAlphaComponent(0.5)
//        leftAxis.valueFormatter = NumberFormatter.init()
//        if let valueFormatter = leftAxis.valueFormatter {
//            valueFormatter.maximumFractionDigits = 1
//        }
//        leftAxis.startAtZeroEnabled = true
//        leftAxis.gridColor = UIColor.lightGray.withAlphaComponent(0.25)
//
//        chartView.rightAxis.enabled = false
//
//        let xAxis: ChartXAxis = chartView.xAxis
//        xAxis.labelPosition = ChartXAxis.LabelPosition.bottom
//        xAxis.drawAxisLineEnabled = false
//        xAxis.spaceBetweenLabels = 0
//        xAxis.axisLineColor = UIColor.lightGray.withAlphaComponent(0.5)
//        xAxis.drawGridLinesEnabled = false
//        xAxis.labelFont = UIFont.systemFont(ofSize: 8)
//    }

//    fileprivate func loadChartData() {
//        var yVals: [BarChartDataEntry] = []
//        for i in 0..<reachImpressions.impressionsData.count {
//            yVals.append((BarChartDataEntry.init(values: reachImpressions.impressionsData[i], xIndex: i)))
//        }
//
//        let set1: BarChartDataSet = BarChartDataSet.init(yVals: yVals, label: "")
//        set1.colors = [PractoConstants.Color.kTurquoiseBlue, PractoConstants.Color.kGraphRedColor]
//
//        var dataSets: [BarChartDataSet] = []
//        dataSets.append(set1)
//
//        let formatter: NumberFormatter = NumberFormatter.init()
//        formatter.maximumFractionDigits = 1
//
//        let data: BarChartData = BarChartData.init(xVals: reachImpressions.weekData, dataSets: dataSets)
//        data.setValueFont(UIFont.init(name: "SFUIText-Regular", size: 14.0))
//        data.setValueFormatter(formatter)
//        data.setDrawValues(false)
//
//        chartView.data = data
//        chartView.dragEnabled = true
//        chartView.setVisibleXRange(minXRange: 5.0, maxXRange: 5.0)
//        chartView.moveViewToX(CGFloat((chartView.barData?.xValCount)!))
//    }
//
//    func loadData() {
//        activityIndicator.startAnimating()
//        activityIndicator.showMessage(NSLocalizedString("Loading chart data", comment: ""), animated: true)
//
//        guard API.hasInternetConnectivity else {
//            activityIndicator.stopAnimating()
//            self.presentController(UIAlertController.NoInternetAlert)
//            return
//        }
//
//        if let doctorId = Profile.getDoctorProfileFromDB(managedObjectContext: DBManager.sharedInstance.childContext)?.fabric_id {
//            API.getReachImpressions(String(describing: doctorId), practiceId: practiceId, subscriptionId: subscriptionId) { (result, responseData) -> Void in
//                self.activityIndicator.stopAnimating()
//                if result == true {
//                    if let data = responseData {
//                        if self.reachImpressions.parse(data) == true {
//                            self.loadChartData()
//                            self.setImpressionsData()
//                        } else {
//                            var errorMessage = NSLocalizedString("Invalid data format", comment: "")
//                            if let error = self.reachImpressions.parseError?.localizedDescription {
//                                errorMessage = error
//                            }
//                            let alert: UIAlertController = UIAlertController.errorAlert(NSLocalizedString("Error", comment: ""), message: errorMessage)
//                            self.present(alert, animated: true, completion: nil)
//                        }
//                    }
//                }
//            }
//        }
//    }

//    func setImpressionsData() {
//        if reachImpressions.organicImpressions == 0 {
//            if reachImpressions.weekData.count != 0 {
////                showReachOnlyView(String(reachImpressions.reachImpressions / reachImpressions.weekData.count))
//            } else {
////                showReachOnlyView(String(reachImpressions.reachImpressions))
//            }
//        } else {
//            if reachImpressions.weekData.count != 0 {
////                showOrganicAndReachView(String(reachImpressions.organicImpressions / reachImpressions.weekData.count ), reachImpressions: String((reachImpressions.reachImpressions + reachImpressions.organicImpressions) / reachImpressions.weekData.count))
//            } else {
////                showOrganicAndReachView(String(reachImpressions.organicImpressions), reachImpressions: String(reachImpressions.reachImpressions + reachImpressions.organicImpressions))
//            }
//        }
//    }

//    fileprivate func showReachOnlyView(_ reachImpressions: String) {
//        noOrganicImpressionsView.isHidden = false
//        organicAndReacView.isHidden = true
//        onlyReachLegendView.isHidden = false
//        organicReachLegendView.isHidden = true
//        onlyReachLabel.text = reachImpressions
//    }
//
//    fileprivate func showOrganicAndReachView(_ organicImpressions: String, reachImpressions: String) {
//        noOrganicImpressionsView.isHidden = true
//        organicAndReacView.isHidden = false
//        onlyReachLegendView.isHidden = true
//        organicReachLegendView.isHidden = false
//        self.withoutReachLeadsLabel.text = organicImpressions
//        self.withReachLeadsLabel.text = reachImpressions
//    }

}
