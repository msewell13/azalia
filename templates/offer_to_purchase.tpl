<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        .header {
            text-align: center;
            font-size: 9pt;
        }    
        .content {
            text-align: justify;
            font-size: 9pt;
        }
        .indented {
            text-indent: 0.5in;
        }
        .padded {
            padding-left: 40px;
            padding-right: 40px;
        }
        .left-padded {
            padding-left: 13px;
        }
        .right-padded {
            padding-right: 40px;
        }
        .clear {
            clear: both;
        }
        .margined {
            margin-left: 12px;
        }
        p {
            margin: 0;
        }
        ol.alpha {
            list-style-type: lower-alpha;
        }
        ol.order-brackets {
            padding: 0;
            counter-reset: alpha;
        }
        ol.order-brackets > li {
            list-style-type: none;
        }
        ol.order-brackets > li:before {
            counter-increment: alpha;
            content:"("counter(alpha, lower-alpha)") "
        }
        li > span {
            font-weight: normal;
        }
        table {
            empty-cells: show;
            width: 100%;
        }
        td {
            padding: 0;
            margin: 0;
        }
        /*tr > td:nth-child(3) {
            padding-left: 40px;
        }*/
        span.labeled { 
            display: inline-block;
            vertical-align: top;
        }
        span.labeled span.label { 
            display: block; 
            text-align: left; 
            /*border-top: 1px solid black; */
            font-size: 9pt;
        }

    </style>
</head>
<body>
    <div class="header">
        <center>OFFER TO PURCHASE</center>
        <center>REAL ESTATE</center>
    </div>
    <div class="content">
        <p>BE IT KNOWN, the undersigned, <b>{{ buyer }}</b> (Buyer) offers to
        purchase from <b>{{ seller }}</b> (Seller) real estate known as
        <b>{{ city_town }}</b> City/Town of <b>{{ county }}</b> County of
        <b>{{ countyof }}</b>, State of <b>{{ stateof }}</b>, said property
        more particularly described as: <b>{{ described_as }}</b>.</p>
        <p>&nbsp;</p>
        <table style="width: auto">
            <tr>
                <td>The purchase price offered is</td>
                <td>$<b>{{ purchase_price_offered }}</b></td>
            </tr>
            <tr>
                <td>Deposit herewith paid</td>
                <td>$<b>{{ deposite_herewith_paid }}</b></td>
            </tr>
            <tr>
                <td>To be placed in escrow</td>
                <td></td>
            </tr>
            <tr>
                <td>Balance at closing</td>
                <td>$<b>{{ balance_at_closing }}</b></td>
            </tr>
            <tr>
                <td>Total purchase price</td>
                <td>$<b>{{ total_purchase_price }}</b></td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>This offer is conditional upon the following terms:</p>
        <ol>
            <li>
                <span>This offer is subject to Buyer obtaining a real estate
                mortgage for no less than <b>{{ mortgage_for_no_less_than
                }}</b> payable over <b>{{ payable_over_years }}</b>
                years with interest not to exceed <b>{{
                not_to_exceed_percent_word }}</b>% at customary terms with a
                firm commitment thereto <b>{{ commitment_thereto_days }}</b> days from date hereof.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>This offer is further subject to Buyer obtaining a
                satisfactory home inspection report and termite/pest report
                within <b>{{ report_within_days }}</b> days from date hereof.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Seller shall pay broker
                <b>{{ seller_shall_pay_broker }}</b>, a commission of
                $<b>{{ commission }}</b> upon closing.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Said property is to be sold free and clear of
                all encumbrances, by good and marketable title, with full
                possession to said property available to Buyer at date
                of closing.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>The parties agree to execute a lease with an Option to
                Buy/Purchase agreement according to the terms of this
                agreement.<span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>The closing shall occur on or about 30 days of acceptance
                at the closing agent office of Prime Closing.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Subject to Inspection and approval of contractors bids by
                buyer to be completed in writing, within 14 business days of
                acceptance of contract by all parties</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Buyer and Seller to pay Normal Closing Costs.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Seller to provide Buyer with access to property upon
                acceptance.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Other terms: <b>{{ other_terms }}</b></span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>This offer shall remain open until
                <b>{{ offer_remain_open_until_clock }}</b>o’clock, <b>{{
                offer_remain_open_until_date }}</b> and if
                not accepted by said time this offer shall be deemed rescinded
                and all deposits shall be refunded.
                Seller’s acknowledgement of #11: <b>{{
                sellers_acknowledgement_of11 }}</b></span>    
                <p>&nbsp;</p>
            </li>
        </ol>
        <p>&nbsp;</p>
        <table>
            <tr>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Buyer Signature</span></span>
                    </center>
                </td>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Seller Signature</span></span>
                    </center>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Buyer Name Printed</span></span>
                    </center>
                </td>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Seller Name Printed</span></span>
                    </center>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label" style="">Buyer Signature</span></span>
                    </center>
                </td>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Seller Signature</span></span>
                    </center>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Buyer Name Printed</span></span>
                    </center>
                </td>
                <td>
                    <center>
                        <span class="labeled">____________________________________________<span
                        class="label">Seller Name Printed</span></span>
                    </center>
                </td>
            </tr>
        </table>
    </div>
</body>
</html>
