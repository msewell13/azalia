<!DOCTYPE html>
<html lang="en">
<head>
    {% set bc = installment_payments.b_or_c_checked %}
    <meta charset="UTF-8">
    <title></title>
    <style>
        .header {
            text-align: center;
            font-size: 12pt;
        }    
        .content {
            text-align: justify;
            font-size: 10pt;
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
            text-align: center; 
            /*border-top: 1px solid black; */
            font-size: 10pt;
        }

    </style>
</head>
<body>
    <div class="header">
        <p><b>PROMISSORY NOTE</b></p>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div class="content">
        <p>
            <span style="float: left"><b>${{ dollars_amount }}</b></span>
            <span style="float: right"><span class="labeled"><b>{{ date
                        }}</b><span class="label">Date</span></span></span>
        </p>
        <div class="clear"></div>
        <p>&nbsp;</p>
        <p>
            <span class="labeled"><b>{{ city_state }}</b><span
                    class="label">City, State</span></span>
        </p>
        <p>&nbsp;</p>
        <p>FOR VALUE RECEIVED, <b>{{ maker }}</b> hereinafter “Maker” promises
        to pay to <b>{{ holder }}</b> hereinafter “Holder” or order at
        <b>{{ order_at }}</b> or other such place as may be designated by
        the Holder from time to time, the principal sum of <b>{{
        principal_sum }}</b> (<b>${{ principal_sum_number
        }}</b>), with interest thereon from the <b>{{ interest_thereon_from_day
        }}</b> day of <b>{{ interest_thereon_from_mo_year }}</b> on the
        unpaid principal at the rate of <b>{{ rate_of_percent_word }}</b>
        percent (<b>{{ rate_of_percent_number }}</b>%) per annum as follows:</p>
        <p>&nbsp;</p>
        <ol class="left-padded" style="margin-top: 0px; margin-bottom: 0px;
            font-weight: bold;">
            <li>
                <span><b>INSTALLMENT PAYMENTS:</b> Maker shall pay, (check one)</span>
                <p>&nbsp;</p>
                <ol class="alpha" type="a" style="padding-left: 13px">
                    <li>
                        <span>(<b>{% if installment_payments.no_installments.checked %}&#10004;{% endif %}</b>) <b>NO INSTALLMENTS.</b> No installment payments are required.
                        </span>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        {% if installment_payments.principal_and_interest_installments.checked %}
                            <span>(<b>{% if installment_payments.principal_and_interest_installments.checked %}&#10004;{% endif %}</b>) <b>PRINCIPAL and INTEREST INSTALLMENTS</b> of <b>{{
                                        installment_payments.principal_and_interest_installments.principal_sum
                                }}</b> Dollars ($<b>{{
                                installment_payments.principal_and_interest_installments.principal_sum_number
                                }}</b>).
                            </span>
                        {% else %}
                        <span>() <b>PRINCIPAL and INTEREST INSTALLMENTS</b> of
                        __________________________ Dollars ($___________).</span>
                        {% endif %}
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span>
                            {% if
                            installment_payments.interest_only_payments.checked %}(<b>&#10004;</b>){% else %}(){% endif %}
                            <b>INTEREST ONLY PAYMENTS</b> on the outstanding
                            principal balance.
                        </span>
                        <p>&nbsp;</p>
                    </li>
                </ol>
            </li>
            <center><b>(The following must be completed if
            “b” or “c” is checked)</b></center>
            <p>&nbsp;</p>
            {% if
                installment_payments.principal_and_interest_installments.checked or
                installment_payments.interest_only_payments.checked %}
                    <p style="font-weight: normal">
                        The installment payments shall begin on the <b>{{ bc.day }}</b>
                        day of <b>{{ bc.mo_year }}</b> and
                        shall continue on the <b>{{ bc.continue }}</b>
                        day of each succeeding: (check one)
                    </p>
                    <p>&nbsp;</p>
                    <p style="font-weight: normal">
                        <span>
                            ({% if bc.cal_month.checked %}<b>&#10004;</b>{% endif
                            %}) calendar month
                        </span>
                        <span class="left-padded">
                            ({% if bc.third_cal_month.checked %}<b>&#10004;</b>{%
                            endif %}) third calendar month
                        </span>
                        <span class="left-padded">
                            ({% if bc.sixth_cal_month.checked
                            %}<b>&#10004;</b>{%
                            endif %}) sixth calendar month
                        </span>
                        <span class="left-padded">
                            ({% if bc.twelfth_cal_month.checked
                            %}<b>&#10004;</b>{% endif %}) twelfth calendar month
                        </span>
                    </p>
                    <p style="font-weight: normal">
                        <span>
                            ({% if bc.other.checked %}<b>&#10004;</b>{% endif
                            %}) Other: {% if bc.other.checked %}<b>{{
                            bc.other.value }}</b>{% else
                            %}_______________________________________________________________________________{% endif %}
                        </span>
                    </p>
            {% else %}        
                <p style="font-weight: normal">The installment payments shall begin on the _________ day of
                _____________________________________,
                and shall continue on the ____________________ day of each
                succeeding: (check one)<p>
                <p>&nbsp;</p>
                <p style="font-weight: normal">
                    <span>() calendar month</span>
                    <span class="left-padded">() third calendar month</span>
                    <span class="left-padded">() sixth calendar month</span>
                    <span class="left-padded">() twelfth calendar month</span>
                </p>
                <p style="font-weight: normal">
                    <span>() Other:
                    _______________________________________________________________________________</span>
                </p>
            {% endif %}        
            <p>&nbsp;</p>
            <li>
                <span><b>DUE DATE:</b> The entire balance of this Note together with
                any and all interest accrued thereon shall be due and
                payable in full on <b>{{ due_date.day }}</b> day of
                <b>{{ due_date.mo_year }}</b>.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>DEFAULT INTEREST:</b> After maturity, or failure to make any
                payment, any unpaid principal shall accrue interest at the rate
                of <b>{{ default_interest.rate_percent_word }}</b> percent
                (<b>{{ default_interest.rate_percent_number }}</b>%) per annum (18% if not filled in)
                OR the maximum rate allowed by law, whichever is less, during such
                period of Maker’s default under this Note.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>ALLOCATION OF PAYMENTS:</b> Each payment shall be credited
                first to any late charge due, second to interest, and the
                remainder to principal.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>PREPAYMENT:</b> Maker may prepay all or part of the balance
                owed under this Note at any time without penalty.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>CURRENCY:</b> All principal and interest payments shall be
                made in lawful money of the United States.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>LATE CHARGE:</b> If Holder receives any installment payment
                more than <b>{{ late_charge.days }}</b> days (15 days if not filled in)
                after its due date, then a late payment charge of
                $<b>{{ late_charge.payment_charge }}</b>, or <b>{{
                late_charge.percent_word }}</b> percent (<b>{{
                late_charge.percent_number }}</b>%) of the installment
                payment (5% of the installment payment if neither is filled in) shall be
                added to the scheduled payment.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>DUE ON SALE: (OPTIONAL-Not applicable unless initialed
                by Holder and Maker to this Note)</b> If this Note is secured
                by a Deed of Trust or any other instrument securing repayment of
                this Note, the property described in such security instruments may
                not be sold or transferred without the Holder’s consent. Upon breach of
                this provision, Holder may declare all sums due under this Note immediately
                due and payable, unless prohibited by applicable law.</span>
                <p>&nbsp;</p>
                <table style="font-weight: normal">
                    <tr>
                        <td>
                            <center><span class="labeled">______________________________<span
                            class="label">Maker (Initials)</span></span></center>
                        </td>
                        <td>
                            <center><span class="labeled">______________________________<span
                            class="label">Holder (Initials)</span></span></center>
                        </td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>ACCELERATION:</b> If Maker fails to make any payment owed
                under this Note, or if Maker defaults under any Deed of
                Trust or any other instruments securing repayment of this Note,
                and such default is not cured within <b>{{ acceleration.days }}</b> days (30 days if not
                filled in) after written notice of such default, then Holder may, at
                its option, declare all outstanding sums owed on this Note to be
                immediately due and payable, in addition to any other rights or remedies that
                Holder may have under the Deed of Trust or other instruments securing repayment
                of this Note.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>ATTORNEYS’ FEES AND COSTS:</b> Maker shall pay all
                costs incurred by Holder in collecting sums due under this Note
                after a default, including reasonable attorneys’ fees, whether or not
                suit is brought. If Maker or Holder sues to enforce this Note or obtain
                a declaration of its rights hereunder, the prevailing party in any such
                proceeding shall be entitled to recover its reasonable attorneys’
                fees and costs incurred in the proceeding (including those incurred
                in any bankruptcy proceeding or appeal) from the non-prevailing
                party.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>WAIVER OF PRESENTMENTS:</b> Maker waives presentment for
                payment, notice of dishonor, protest and notice of protest.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>NON-WAIVER:</b> No failure or delay by Holder in exercising
                Holder’s rights under this Note shall be a waiver of such
                rights.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>SEVERABILITY:</b> If any clause or any other portion of this
                Note shall be determined to be void or unenforceable for any
                reason, such determination shall not affect the validity
                or enforceability of any other clause or portion of this Note, all
                of which shall remain in full force and effect.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>INTEGRATION:</b> There are no verbal or other agreements
                which modify or affect the terms of this Note. This Note
                may not be modified or amended except by written agreement
                signed by Maker and Holder.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>CONFLICTING TERMS:</b> In the event of any conflict between
                the terms of this Note and the terms of any Deed of Trust
                or other instruments securing payment of this Note,
                the terms of this Note shall prevail.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>EXECUTION:</b> Each Maker executes this Note as a principal
                and not as a surety. If there is more than one
                Maker, each such Maker shall be jointly and severally
                liable under this Note.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>COMMERCIAL PROPERTY: (OPTIONAL-Not applicable unless
                initialed by Holder and Maker to this Note)</b> Maker
                represents and warrants to Holder that the sums represented by
                this Note are being used for business, investment or commercial
                purposes, and not for personal, family or household purposes.</span>
                <p>&nbsp;</p>
                <table style="font-weight: normal">
                    <tr>
                        <td>
                            <center><span class="labeled">______________________________<span
                            class="label">Maker (Initials)</span></span></center>
                        </td>
                        <td>
                            <center><span class="labeled">______________________________<span
                            class="label">Holder (Initials)</span></span></center>
                        </td>
                    </tr>
                </table>
                <p>&nbsp;</p>
                <p style="font-weight: normal"><b>ORAL AGREEMENTS:</b> ORAL AGREEMENTS
                OR ORAL COMMITMENTS TO LOAN MONEY, TO EXTEND CREDIT, OR TO FOREBEAR
                FROM ENFORCING REPAYMENT OF A DEBT ARE NOT ENFORCEABLE UNDER WASHINGTON
                LAW.</p>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>DEFINITIONS:</b> The word Maker shall be construed
                interchangeably with the words Borrower or Payer and the
                word Holder shall be construed interchangeably with the words
                Lender or Payee. In this Note, singular and plural words shall be
                construed interchangeably as may be appropriate in the context and
                circumstances to which such words apply.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>ADDITIONAL TERMS AND CONDITIONS:</b> (check one)</span>
                <p>&nbsp;</p>
                <ol class="left-padded alpha" style="font-weight: bold">
                    <li>
                        <span style="font-weight: bold">({% if addit_terms_condititions.a.checked
                        %}&#10004;{% endif %}) NONE</span>
                        <p>&nbsp;</p>
                        <b style="margin-left: -14px">OR</b>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        <span style="font-weight: bold">({% if addit_terms_condititions.b.checked
                        %}<b>&#10004;</b>{% endif %}) As set forth on the
                        attached “Exhibit A” which is incorporated by this
                        reference</span>
                        <p>&nbsp;</p>
                    </li>
                </ol>
                <p style="margin-left: -20px">(Note: If neither a or b is
                checked, then option “a” applies)</p>
                <p>&nbsp;</p>
            </li>
            <li>
                <span><b>THIS NOTE IS SECURED BY ({% if
                secured_by.deed_of_trust.checked %}&#10004;{% endif %})
                DEED OF TRUST, ({% if secured_by.mortgage.checked %}&#10004;{% endif %})
                MORTGAGE, ({% if secured_by.another.checked
                %}&#10004;{% endif %}) {% if secured_by.another.checked
                %} {{ secured_by.another.value }} {% else %}___________________{% endif %} OF EVEN DATE.</b></span>            
                <p>&nbsp;</p>
            </li>
        </ol>
        <p>Maker (signatures)</p>
        <p>&nbsp;</p>
        <table>
            <tr>
                <td>__________________________________</td>
                <td>__________________________________</td>
            </tr>
            <tr>
                <td>
                    <p>&nbsp;</p>
                </td>
                <td>
                    <p>&nbsp;</p>
                </td>
            </tr>
            <tr>
                <td>__________________________________</td>
                <td>__________________________________</td>
            </tr>
        </table>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p><span style="border-bottom: 1px solid black">Maker’s address for all notices given by
        Holder under this
        Note:<span>____________________________________</span></span></p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <center><b>DO NOT DESTROY THIS NOTE</b></center>
        <p>&nbsp;</p>
        <p>WHEN PAID this original Note together with the Deed of Trust
        securing the same, must be surrendered to the Trustee for
        cancellation and retention before any reconveyance can be processed.</p>
    </div>

        <p style="page-break-after:always;"></p>

        <div class="header"><p><b>Exhibit A</b></p></div>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <div class="content">
        <p>Maker agrees to pay holder a loan origination fee of <b>{{ loan_fee_spelled }}</b> (<b>${{ loan_fee_num }}</b>) at the maturity of this note.</p></div>



    
</body>
</html>
