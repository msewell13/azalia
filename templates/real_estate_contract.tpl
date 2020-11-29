<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>

        .preheader {
            text-align: left;
            font-size: 12pt;
        }
        .header {
            text-align: center;
            font-size: 12pt;
        }    
        .content {
            text-align: justify;
            font-size: 10pt;
        }
        /*li {
            list-style-position: inside;
        }*/
        .indented {
            text-indent: 0.5in;
        }
        .padded {
            padding-left: 60px;
        }
        .margined {
            margin-left: -12px;
        }
        p {
            margin: 0;
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
        table {
            empty-cells: show;
        }
        td {
            padding: 0;
            margin: 0;
        }
        tr > td:nth-child(3) {
            padding-left: 40px;
        }
        span.labeled { 
            display: inline-block;
            vertical-align: top;
        }
        span.labeled span.label { 
            display: block; 
            text-align: center; 
            /*border-top: 1px solid black; */
            font-size: 8pt;
        }

    </style>
</head>
<body>
    <div class="preheader">
        <p class="indented">When recorded return to:</p>
        <p class="indented"><b>{{ when_recorded_to.name }}</b></p>
        <p class="indented"><b>{{ when_recorded_to.street_address }}</b></p>
        <p class="indented"><b>{{ when_recorded_to.city_state }}</b></p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
    </div>
    <div class="header">
        <p><b>REAL ESTATE CONTRACT</b></p>
        <p><b>(RESIDENTIAL SHORT FORM)</b></p>
    </div>
    <p>&nbsp;</p>
    <div class="content">
        <p style="padding-left: 40px">ANY OPTIONAL PROVISION NOT INITIALED BY ALL PERSONS SIGNING THIS
        CONTRACT--WHETHER INDIVIDUALLY OR AS AN OFFICER OR AGENT -- IS NOT A
        PART OF THIS CONTRACT.</p>
        <p style="font-size: 12pt">&nbsp;</p>
        <p style="font-size: 12pt">&nbsp;</p>
        <ol class="padded" style="margin-bottom: 0; margin-top: 0;">
            <li>
                <span>PARTIES AND DATE.  This Contract is entered into on
                <b>{{ contract_is_entered_on }}</b>, between <b>{{ between_as_seller }}</b> 
                as "Seller" and <b>{{ between_as_purchaser }}</b> as "Purchaser".</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>SALE AND LEGAL DESCRIPTION. Seller agrees to sell to
                Purchaser and Purchaser agrees to purchase from Seller the
                following described real estate in <b>{{ sell_county }}</b> County, State
                of Washington:</span>
                <p><b>{{ sale_legal_description }}</b></p>
                <p>&nbsp;</p>
                <p class="margined">Abbreviated Legal: <span style="font-size: 8pt">(Required if full legal not inserted above.)</span></p>
                <p class="margined"><b>{{ abbreviated_legal }}</b></p>
                <p>&nbsp;</p>
                <p class="margined">Tax Parcel Number(s):</p>
                <p class="margined"><b>{{ tax_parcel_number }}</b></p>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>PERSONAL PROPERTY.  Personal property, if any, included
                in the sale is as follows:</span>
                <p><b>{{ personal_property }}</b></p>
                <p>&nbsp;</p>
                <p class="margined">No part of the purchase price is attributed
                to personal property.</p>
            </li>
            <li>
                <ol class="order-brackets">
                    <li>
                        <span>PRICE. Purchaser agrees to pay: $<b>{{
                        price.purchaser_agrees }}</b> Total Price</span>
                        <p style="padding-left: 18px">Less $<b>{{ price.less_down_payment }}</b> Down Payment</p>
                        <p style="padding-left: 18px">Less $<b>{{ price.less_assumed_obligation }}</b> Assumed Obligation(s)</p>
                        <p style="padding-left: 18px">Results in $<b>{{ price.amount_financed_by_seller }}</b> Amount Financed by Seller.</p>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span>ASSUMED OBLIGATIONS. Purchaser agrees to pay the
                        above assumed obligation(s) by assuming and agreeing to pay
                        that certain <span class="labeled"><b>{{
                        agreeing_to_pay_that_certain
                        }}</b><span class="label">(Mortgage/Deed of
                        Trust/Contract)</span></span>
                        dated <b>{{ dated }}</b>, recorded as Auditor's File
                        No. <b>{{ auditor_file_no }}</b>.</span>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px">Seller warrants the
                        unpaid balance of said obligation is $<b>{{
                        unpaid_balance_of_obligation }}</b> which is payable
                        <b>${{ balance_payable_on_before }}</b> on or before the <b>{{
                        balance_payable_before_day }}</b> day of <b>{{
                        balance_payable_month_year }}</b> ( ) including ( )
                        plus interest at the rate of <b>{{
                        balance_payable_interest_at_rate_of_percent }}</b>% per annum on the declining balance 
                        thereof; and a like amount on or before the <b>{{
                        balance_payable_a_like_amount_before_day }}</b> day of each and every 
                        <span class="labeled"><b>{{ balance_payable_day_ofeach_every_month_year
                        }}</b><span class="label">(month/year)</span></span> thereafter until paid in full.</p>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px"><b>NOTE:</b>&nbsp;Fill in the
                        date in the following two lines only if there is an early
                        cash out date on the assumed obligation.</p>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px">NOTWITHSTANDING THE
                        ABOVE, THE ENTIRE BALANCE OF PRINCIPAL AND INTEREST IS
                        DUE IN FULL NOT LATER THAN <b>{{
                        entire_balance_is_due_infull_not_later_than.day_and_month
                        }}</b>, <b>{{
                        entire_balance_is_due_infull_not_later_than.year }}</b>.</p>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span>PAYMENT OF AMOUNT FINANCED BY SELLER.</span>
                        <p style="padding-left: 18px">Purchaser agrees to pay the sum of
                        ${{purchaser_agrees_paying_sum}} as follows:</p>
                        <p style="padding-left: 18px">
                        $<b>{{ sum_or_more_purchaser_option }}</b> or more at
                        purchaser's option on or before the <b>{{
                        purchaser_option_on_before_day }}</b> day of 
                        <b>{{ purchaser_option_month_year }}</b> ( ) including ( ) plus interest from 
                        <b>{{ purchaser_interest_from }}</b> at the rate of
                        <b>{{ purchaser_at_rate_of_percent }}</b>% per annum on the declining balance 
                        thereof; and a like amount or more on or before the
                        <b>{{ purchaser_a_like_amount_before_day }}</b> day of each and every
                        <span class="labeled"><b>{{
                        purchaser_of_each_every_month_year
                        }}</b><span class="label">(month/year)</span></span> thereafter until paid in full.</p>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px"><b>NOTE:</b>&nbsp;Fill in
                        the date in the following two lines only if there is an
                        early cash out date on the amount financed by seller.</p>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px">NOTWITHSTANDING THE
                        ABOVE, THE ENTIRE BALANCE OF PRINCIPAL AND INTEREST IS
                        DUE IN FULL NOT LATER THAN <b>{{
                        purchaser_balance_is_due_infull_not_later_than }}</b>.</p>
                        <p>&nbsp;</p>
                        <p style="padding-left: 18px">Payments are applied
                        first to interest and then to principal. Payments
                        shall be made at <b>{{ payments_shall_be_made_at_1 }}</b>
                        <b>{{ payments_shall_be_made_at_2 }}</b> or such other place
                        as the Seller may hereafter indicate in writing.</p>
                    </li>
                </ol>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>FAILURE TO MAKE PAYMENTS ON ASSUMED OBLIGATIONS. If
                Purchaser fails to make any payments on assumed
                obligation(s), Seller may give written notice to Purchaser that
                unless Purchaser makes the delinquent payment(s) within 15 days, Seller
                will make the payment(s), together with any late charge, additional
                interest, penalties, and costs assessed by the Holder of the assumed
                obligation(s). The 15-day period may be shortened to avoid the exercise of any
                remedy by the Holder of the assumed obligation(s). Purchaser shall immediately
                after such payment by Seller reimburse Seller for the amount of such payment
                plus a late charge equal to five percent (5%) of the amount so paid plus all
                costs and attorney fees incurred by Seller in connection with making such
                payment.</span>            
                <p>&nbsp;</p>
            </li>
            <li>
                <ol class="order-brackets">
                    <li>
                        <span>OBLIGATIONS TO BE PAID BY SELLER. The Seller
                        agrees to continue to pay from payments received
                        hereunder the following obligation, which obligation
                        must be paid in full when Purchaser pays the purchase price
                        in full: That certain <span class="labeled"><b>{{
                        obligations_to_be_paid_by_seller.mortgage_deedtrust_contract
                        }}</b><span class="label">(Mortgage/Deed of
                        Trust/Contract)</span></span> dated <b>{{
                        obligations_to_be_paid_by_seller.dated }}</b>, recorded
                        as Auditor’s File No. <b>{{
                        obligations_to_be_paid_by_seller.auditor_file_no
                        }}</b>.</span>
                        <p>&nbsp;</p>
                        <p>ANY ADDITIONAL OBLIGATION
                        TO BE PAID BY SELLER ARE INCLUDED IN ADDENDUM</p>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span>EQUITY OF SELLER PAID IN FULL. If the balance
                        owed the Seller on the purchase price herein
                        becomes equal to the balance owed on prior encumbrances
                        being paid by Seller, Purchaser will be deemed to have assumed
                        said encumbrances as of that date. Purchaser shall thereafter make
                        payments directly to the holders of said encumbrances and make no
                        further payments to Seller. Seller shall at that time deliver to
                        Purchaser a fulfillment deed in accordance with the provisions of paragraph
                        8.</span>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span>FAILURE OF SELLER TO MAKE PAYMENTS ON PRIOR
                        ENCUMBRANCES. If Seller fails to make any payments on
                        any prior encumbrance, Purchaser may give written notice to
                        Seller that unless Seller makes the delinquent payments within
                        15 days, Purchaser will make the payments together with any late
                        charge, additional interest, penalties, and costs assessed by the
                        holder of the prior encumbrance. The 15-day period may be shortened to
                        avoid the exercise of any remedy by the holder of the prior encumbrance.
                        Purchaser may deduct the amounts so paid plus a late charge of 5% of the amount
                        so paid and any attorneys' fees and costs incurred by Purchaser in connection
                        with the delinquency from payments next becoming due Seller on the purchase
                        price. In the event Purchaser makes such delinquent payments on three
                        occasions, Purchaser shall have the right to make all payments due thereafter
                        directly to the holder of such prior encumbrance and deduct the then balance
                        owing on such prior encumbrance from the then balance owing on the purchase
                        price and reduce periodic payments on the balance due Seller by the payments
                        called for in such prior encumbrance as such payments become due.</span>
                        <p>&nbsp;</p>
                    </li>
                </ol>
            </li>
            <li>
                <span>OTHER ENCUMBRANCES AGAINST THE PROPERTY. The property is
                subject to encumbrances including the following listed
                tenancies, easements, restrictions, and reservations in
                addition to the obligations assumed by Purchaser and the
                obligations being paid by Seller:</span>
                <p><b>{{ tenancies_easements }}</b></p>
                <p>ANY ADDITIONAL NON-MONETARY ENCUMBRANCES ARE INCLUDED IN
                ADDENDUM</p>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>FULFILLMENT DEED. Upon payment of all amounts due
                Seller, Seller agrees to deliver to Purchaser a Statutory
                Warranty Deed in fulfillment of this Contract. The covenants
                of warranty in said deed shall not apply to any encumbrances
                assumed by Purchaser or to defects in title arising subsequent to the
                date of this Contract by, through, or under persons other than the Seller
                herein. Any personal property included in the sale shall be included in the
                fulfillment deed.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>LATE CHARGES. If any payment on the purchase price is
                not made within ten (10) days after the date it is due,
                Purchaser agrees to pay a late charge equal to 5% of the amount
                of such payment. Such late payment charge shall be in addition to all
                other remedies available to Seller and the first amounts received from
                Purchaser after such late charges are due shall be applied to the late
                charges.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>NO ADVERSE EFFECT ON PRIOR ENCUMBRANCES. Seller warrants
                that entry into this Contract will not cause in any prior
                encumbrance (a) a breach, (b) accelerated payments, or (c) an
                increased interest rate; unless (a), (b), or (c) has been consented
                to by Purchaser in writing.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>POSSESSION. Purchaser is entitled to possession of the
                property from and after the date of this Contract or
                <b>{{ possession_later_date }}</b>, whichever is later,
                subject to any tenancies described in paragraph 7.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>TAXES, ASSESSMENTS, AND UTILITY LIENS. Purchaser agrees
                to pay by the date due all taxes and assessments becoming a
                lien against the property after the date of this Contract.
                Purchaser may in good faith contest any such taxes or assessments
                so long as no forfeiture or sale of the property is threatened as the
                result of such contest. Purchaser agrees to pay when due any utility
                charges which may become liens superior to Seller's interest under this
                Contract. If real estate taxes and penalties are assessed against the property
                subsequent to date of this Contract because of a change in use prior to the
                date of this Contract for Open Space, Farm, Agricultural, or Timber
                classifications approved by the County or because of a Senior Citizen's
                Declaration to Defer Property Taxes filed prior to the date of this Contract,
                Purchaser may demand in writing payment of such taxes and penalties within 30
                days.  If payment is not made, Purchaser may pay and deduct the amount thereof
                plus 5% penalty from the payments next becoming due Seller under the Contract.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>INSURANCE. Purchaser agrees to keep all buildings now or
                hereafter erected on the property described herein continuously
                insured under fire and extended coverage policies in an amount not
                less than the balances owed on obligations assumed by Purchaser plus the
                balance due Seller, or full insurable value, whichever is lower. All
                policies shall be held by the Seller and be in such companies as the Seller may
                approve and have loss payable first to any holders of underlying encumbrances,
                then to Seller as their interests may appear and then to Purchaser. Purchaser
                may within 30 days after loss negotiate a contract to substantially restore the
                premises to their condition before the loss. If insurance proceeds are
                sufficient to pay the contract price for restoration or if the Purchaser
                deposits in escrow any deficiency with instructions to apply the funds on the
                restoration contract, the property shall be restored unless the underlying
                encumbrances provide otherwise. Otherwise the amount collected under any
                insurance policy shall be applied upon any amounts due hereunder in such order
                as Seller shall determine. In the event of forfeiture, all rights of Purchaser
                in insurance policies then in force shall pass to Seller.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>NONPAYMENT OF TAXES, INSURANCE, AND UTILITIES
                CONSTITUTING LIENS. If Purchaser fails to pay taxes or
                assessments, insurance premiums, or utility charges
                constituting liens prior to Seller's interest under this Contract,
                Seller may pay such items and Purchaser shall forthwith pay Seller the
                amount thereof plus a late charge of 5% of the amount thereof plus any
                costs and attorney's fees incurred in connection with making such payment.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>CONDITION OF PROPERTY. Purchaser accepts the property in
                its present condition and acknowledges that Seller, his/her
                agents, and subagents have made no representation or warranty
                concerning the physical condition of the property or the uses to
                which it may be put other than as set forth herein. Purchaser agrees
                to maintain the property in such condition as complies with all applicable
                laws.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>RISK OF LOSS. Purchaser shall bear the risk of loss for
                destruction or condemnation of the property.  Any such loss
                shall not relieve Purchaser from any of Purchaser's obligations
                pursuant to this Contract.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>WASTE. Purchaser shall keep the property in good repair
                and shall not commit or suffer waste or willful damage to
                or destruction of the property. Purchaser shall not remove
                commercial timber without the written consent of Seller.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>AGRICULTURAL USE. If this property is to be used
                principally for agricultural purposes, Purchaser agrees to
                conduct farm and livestock operations in accordance with good
                husbandry practices. In the event a forfeiture action is instituted,
                Purchaser consents to Seller's entry on the premises to take any reasonable
                action to conserve soil, crops, trees, and livestock.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>CONDEMNATION. Seller and Purchaser may each appear as
                owners of an interest in the property in any action
                concerning condemnation of any part of the property. Purchaser
                may within 30 days after condemnation and removal of improvements,
                negotiate a contract to substantially restore the premises to their
                condition before the removal. If the condemnation proceeds are sufficient
                to pay the contract price for restoration or if the Purchaser deposits in
                escrow any deficiency with instructions to apply the funds on the restoration
                contract, the property shall be restored unless underlying encumbrances provide
                otherwise. Otherwise, proceeds of the award shall be applied in payment of the
                balance due on the purchase price, as Seller may direct.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>DEFAULT. If the Purchaser fails to observe or perform any
                term, covenant, or condition of this Contract, Seller may:</span>
                <p>&nbsp;</p>
                <ol class="order-brackets">
                    <li>
                        <span>Suit for Installments. Sue for any delinquent
                        periodic payment; or</span>
                    </li>
                    <li>
                        <span>Specific Performance. Sue for specific
                        performance of any of Purchaser's obligations pursuant
                        to this Contract; or</span>
                    </li>
                    <li>
                        <span>Forfeit Purchaser's Interest. Forfeit this
                        Contract pursuant to Ch. 61.30, RCW, as it is
                        presently enacted and may hereafter be amended. The
                        effect of such forfeiture includes: (i) all right, title,
                        and interest in the property of the Purchaser and all persons
                        claiming through the Purchaser shall be terminated; (ii) the
                        Purchaser's rights under the Contract shall be cancelled; (iii) all
                        sums previously paid under the Contract shall belong to and be retained by
                        the Seller or other person to whom paid and entitled thereto; (iv) all
                        improvements made to and unharvested crops on the property shall belong to the
                        Seller; and (v) Purchaser shall be required to surrender possession of the
                        property, improvements, and unharvested crops to the Seller 10 days after the
                        forfeiture.</span>
                    </li>
                    <li>
                        <span>Acceleration of Balance Due. Give Purchaser
                        written notice demanding payment of said delinquencies
                        and payment of a late charge of 5% of the amount of such
                        delinquent payments and payment of Seller's reasonable
                        attorney's fees and costs incurred for services in preparing and
                        sending such Notice and stating that if payment pursuant to said Notice
                        is not received within 30 days after the date said Notice is either deposited
                        in the mail addressed to the Purchaser or personally delivered to the
                        Purchaser, the entire balance owing, including interest, will become
                        immediately due and payable. Seller may thereupon institute suit for payment
                        of such balance, interest, late charge, and reasonable attorney's fees and
                        costs.</span>
                    </li>
                    <li>
                        <span>Judicial Foreclosure. Sue to foreclose this
                        Contract as a mortgage, in which event Purchaser may be
                    liable for a deficiency.</span>
                    </li>
                </ol>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>RECEIVER. If Seller has instituted any proceedings
                specified in Paragraph 20 and Purchaser is receiving rental
                or other income from the property, Purchaser agrees that the
                appointment of a receiver for the property is necessary to protect
                Seller's interest.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>PURCHASER'S REMEDY FOR SELLER'S DEFAULT. If Seller fails
                to observe or perform any term, covenant, or condition of this
                Contract, Purchaser may, after 30 days' written notice to Seller,
                institute suit for damages or specific performance unless the
                breaches designated in said notice are cured.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>NON-WAIVER. Failure of either party to insist upon strict
                performance of the other party's obligations hereunder shall
                not be construed as a waiver of strict performance thereafter
                of all of the other party's obligations hereunder and shall not
                prejudice any remedies as provided herein.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>ATTORNEY'S FEES AND COSTS. In the event of any breach of
                this Contract, the party responsible for the breach agrees to
                pay reasonable attorney's fees and costs, including costs of
                service of notices and title searches, incurred by the other party.
                The prevailing party in any suit instituted arising out of this Contract
                and in any forfeiture proceedings arising out of this Contract shall be
                entitled to receive reasonable attorney's fees and costs incurred in such suit
                or proceedings.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>NOTICES. Notices shall be either personally served or
                shall be sent certified mail, return receipt requested, and
                by regular first class mail to Purchaser at <b>{{
                purchaser_mail_address }}</b>
                and to the Seller at <b>{{ seller_mail_address }}</b>
                or such other addresses as either party may specify in writing to the other
                party.  Notices shall be deemed given when served or mailed.  Notice to Seller
                shall also be sent to any institution receiving payments on the Contract.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>TIME FOR PERFORMANCE. Time is of the essence in
                performance of any obligations pursuant to this Contract.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>SUCCESSORS AND ASSIGNS. Subject to any restrictions
                against assignment, the provisions of this Contract shall
                be binding on the heirs, successors, and assigns of the Seller
                and the Purchaser.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>OPTIONAL PROVISION -- SUBSTITUTION AND SECURITY ON
                PERSONAL PROPERTY. Purchaser may substitute for any
                personal property specified in Paragraph 3 herein other
                personal property of like nature which Purchaser owns free and
                clear of any encumbrances. Purchaser hereby grants Seller a security
                interest in all personal property specified in Paragraph 3 and future
                substitutions for such property and agrees to execute a financing statement
                under the Uniform Commercial Code reflecting such security interest.</span>
                <p>&nbsp;</p>
                <table style="margin-left: -18px">
                    <tr>
                        <td><center>SELLER</center></td>
                        <td style="padding-left: 40px"><center>INITIALS:</center></td>
                        <td><center>PURCHASER</center></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>OPTIONAL PROVISION -- ALTERATIONS. Purchaser shall not
                make any substantial alteration to the improvements on the
                property without the prior written consent of Seller, which consent
                will not be unreasonably withheld.</span>
                <p>&nbsp;</p>
                <table style="margin-left: -18px">
                    <tr>
                        <td><center>SELLER</center></td>
                        <td style="padding-left: 40px"><center>INITIALS:</center></td>
                        <td><center>PURCHASER</center></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>OPTIONAL PROVISION -- DUE ON SALE. If Purchaser, without
                written consent of Seller, (a) conveys, (b) sells, (c) leases,
                (d) assigns, (e) contracts to convey, sell, lease or assign, (f)
                grants an option to buy the property, (g) permits a forfeiture or
                foreclosure or trustee or sheriffs sale of any of the Purchaser's
                interest in the property or this Contract, Seller may at any time
                thereafter either raise the interest rate on the balance of the purchase price
                or declare the entire balance of the purchase price due and payable. If one or
                more of the entities comprising the Purchaser is a corporation, any transfer or
                successive transfers in the nature of items (a) through (g) above of 49% or
                more of the outstanding capital stock shall enable Seller to take the above
                action. A lease of less than 3 years (including options for renewals), a
                transfer to a spouse or child of Purchaser, a transfer incident to a marriage
                dissolution or condemnation, and a transfer by inheritance will not enable
                Seller to take any action pursuant to this Paragraph; provided the transferee
                other than a condemnor agrees in writing that the provisions of this paragraph
                apply to any subsequent transaction involving the property entered into by the
                transferee.</span>
                <p>&nbsp;</p>
                <table style="margin-left: -18px">
                    <tr>
                        <td><center>SELLER</center></td>
                        <td style="padding-left: 40px"><center>INITIALS:</center></td>
                        <td><center>PURCHASER</center></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>OPTIONAL PROVISION -- PRE-PAYMENT PENALTIES ON PRIOR
                ENCUMBRANCES. If Purchaser elects to make payments in
                excess of the minimum required payments on the purchase price
                herein, and Seller, because of such prepayments, incurs prepayment
                penalties on prior encumbrances, Purchaser agrees to forthwith pay Seller
                the amount of such penalties in addition to payments on the purchase price.</span>
                <p>&nbsp;</p>
                <table style="margin-left: -18px">
                    <tr>
                        <td><center>SELLER</center></td>
                        <td style="padding-left: 40px"><center>INITIALS:</center></td>
                        <td><center>PURCHASER</center></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>OPTIONAL PROVISION -- PERIODIC PAYMENTS ON TAXES AND
                INSURANCE. In addition to the periodic payments on the
                purchase price, Purchaser agrees to pay Seller such portion of
                the real estate taxes and assessments and fire insurance premium as
                will approximately total the amount due during the current year based
                on Seller's reasonable estimate.</span>
                <p>&nbsp;</p>
                <p>The payments during the current year shall be $<b>{{ payments_during_curr_year }}</b> per <b>{{
                payments_shouldbe_per }}</b>. Such
                "reserve" payments from Purchaser shall not accrue interest. Seller
                shall pay when due all real estate taxes and insurance premiums, if
                any, and debit the amounts so paid to the reserve account. Purchaser and
                Seller shall adjust the reserve account in April of each year to reflect excess
                or deficit balances and changed costs. Purchaser agrees to bring the reserve
                account balance to a minimum of $10 at the time of adjustment.</p>
                <p>&nbsp;</p>
                <table style="margin-left: -18px">
                    <tr>
                        <td><center>SELLER</center></td>
                        <td style="padding-left: 40px"><center>INITIALS:</center></td>
                        <td><center>PURCHASER</center></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>______________________________________</td>
                        <td>&nbsp;</td>
                        <td>______________________________________</td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>ADDENDA. Any addenda attached hereto are a part of this
                Contract.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>ENTIRE AGREEMENT. This Contract constitutes the entire
                agreement of the parties and supersedes all prior
                agreements and understandings, written or oral. This Contract
                may be amended only in writing executed by Seller and Purchaser.</span>
                <p>&nbsp;</p>
            </li>
        </ol>
        <p style="padding-left: 40px">IN WITNESS WHEREOF the parties have signed and sealed this Contract
        the day and year first above written.</p>
        <p>&nbsp;</p>
        <table style="padding-left: 40px">
            <tr>
                <td><center>SELLER</center></td>
                <td style="padding-left: 40px"><center>INITIALS:</center></td>
                <td><center>PURCHASER</center></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>______________________________________</td>
                <td>&nbsp;</td>
                <td>______________________________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>______________________________________</td>
                <td>&nbsp;</td>
                <td>______________________________________</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">STATE OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">COUNTY OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">I certify that I know or have
        satisfactory evidence
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        (is/are) the person(s) who appeared before me, and said person(s)
        acknowledged that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signed this instrument and acknowledged it to be&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
free and voluntary act for the uses and purposes mentioned in this instrument.</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">Dated:</p>
        <p>&nbsp;</p>
        <table style="padding-left: 40px">
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">______________________________________________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary name printed or typed:</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary Public in and for the State of</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Residing at</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">My appointment expires:</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">STATE OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">COUNTY OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">I certify that I know or have
        satisfactory evidence
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        (is/are) the person(s) who appeared before me, and said person(s)
        acknowledged that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; signed this instrument and acknowledged it to be&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
free and voluntary act for the uses and purposes mentioned in this instrument.</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">Dated:</p>
        <p>&nbsp;</p>
        <table style="padding-left: 40px">
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">______________________________________________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary name printed or typed:</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary Public in and for the State of</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Residing at</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">My appointment expires:</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">STATE OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">COUNTY OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">I certify that I know or have
        satisfactory evidence
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        (is/are) the person(s) who appeared before me, and said person(s)
        acknowledged
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        signed this instrument, on oauth stated that &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        authorized to execute the instrument and acknowledge it as the
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        of
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        to be the free and voluntary act of such party(ies) for the uses and purposes
        mentioned in this instrument.</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">Dated:</p>
        <p>&nbsp;</p>
        <table style="padding-left: 40px">
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">______________________________________________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary name printed or typed:</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary Public in and for the State of</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Residing at</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">My appointment expires:</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">STATE OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">COUNTY OF</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">I certify that I know or have
        satisfactory evidence
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        (is/are) the person(s) who appeared before me, and said person(s)
        acknowledged
        that&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        signed this instrument, on oauth stated that &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        authorized to execute the instrument and acknowledge it as the
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        of
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        to be the free and voluntary act of such party(ies) for the uses and purposes
        mentioned in this instrument.</p>
        <p>&nbsp;</p>
        <p style="padding-left: 40px">Dated:</p>
        <p>&nbsp;</p>
        <table style="padding-left: 40px">
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">______________________________________________________</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary name printed or typed:</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Notary Public in and for the State of</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">Residing at</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="padding-left: 250px">My appointment expires:</td>
            </tr>
        </table>
    </div>
</body>
</html>
