<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        .preheader {
            text-align: justify;
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
    <div class="preheader">
        <p>When recorded return to:</p>  
        <p><b>{{ name }}</b></p>
        <p><b>{{ street_address }}</b></p>
        <p><b>{{ city_state }}</b></p>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div class="header">
        <center><b>DEED OF TRUST</b></center>
        <center><i>(For use in the State of Washington only)</i></center>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div class="content">
        <p>THIS DEED OF TRUST, made this <b>{{ day }}</b> day of <b>{{ mo_year
        }}</b> between </p>
        {% for grantor in grantors %}
            <p><b>{{ grantor }}</b></p>
        {% endfor %}
        <p>as GRANTOR(S),</p>
        <p>whose address is</p>
        <p><b>{{ grantors_address }}</b></p>
        <p>and</p>
        <p><b>{{ trustee }}</b></p>
        <p>as TRUSTEE,</p>
        <p>whose address is</p>
        <p><b>{{ trustee_address }}</b></p>
        <p>and</p>
        <p><b>{{ beneficiary }}</b></p>
        <p>as BENEFICIARY,</p>
        <p>whose address is</p>
        <p><b>{{ beneficiary_address }}</b></p>
        <p>&nbsp;</p>
        <p>WITNESSETH: Grantor(s) hereby bargain(s), sell(s), and convey(s) to
        Trustee in trust, with power of sale, the following described real property
        in <b>{{ county }}</b> County, Washington:</p>
        <p>&nbsp;</p>
        <p><b>{{ real_property_description }}</b></p>
        <p>&nbsp;</p>
        <p>Abbreviated Legal: <span style="font-size: 8pt">(Required if full legal not inserted above.)</span></p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p><b>{{ abbreviated_legal }}</b></p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>Tax Parcel Number(s):</p>
        {% for tax in tax_parcel_numbers %}
            <p><b>{{ tax }}</b></p>
        {% endfor %}
        <p style="page-break-after:always;"></p>

        <p>&nbsp;</p>
        <p>which real property is not used principally for agricultural or
        farming purposes, together with all the tenements, hereditaments,
        and appurtenances now or hereafter thereunto belonging or in any wise
        appertaining, and the rents, issues, and profits thereof.</p>
        <p>&nbsp;</p>
        <p>This Deed of Trust is for the purpose of securing performance of/ach
        agreement of Grantor(s) contained in this Deed of Trust, and payment of
        the sum of <b>{{ payment_of_the_sum_word }} Dollars 
        (${{ payment_of_the_sum_number }}</b>) with interest, in accordance with
        the terms of a promissory note of even date herewith, payable to
        Beneficiary or order, and made by Grantor(s), and all renewals,
        modifications, and extensions thereof, and also such further sums as
        may be advanced or loaned by Beneficiary to Grantor(s), or any of
        Grantor(s)’ successors or assigns, together with interest thereon
        at such rate as shall be agreed upon.</p>
        <p>&nbsp;</p>
        <p><b>DUE DATE:</b> The entire balance of the promissory note secured by this
        Deed of Trust, together with any and all interest accrued thereon,
        shall be due and payable in full on <b>{{ payable_in_full_on_date
        }}</b>.<p>
        <p>&nbsp;</p>
        <p>To protect the security of this Deed of Trust, Grantor(s)
        covenant(s) and agree(s):</p>
        <p>&nbsp;</p>
        <ol class="left-padded" style="margin: 0">
            <li>
                <span>To keep the property in good condition and repair; to
                permit no waste thereof; to complete any building,
                structure, or improvement being built or about to be built
                thereon; to restore promptly any building, structure, or
                improvement thereon which may be damaged or destroyed; and to comply
                with all laws, ordinances, regulations, covenants, conditions, and
                restrictions affecting the property.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>To pay before delinquent all lawful taxes and assessments
                upon the property; to keep the property free and clear of all
                other charges, liens, or encumbrances impairing the security of
                this Deed of Trust.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>To keep all buildings now or hereafter erected on the property described herein continuously insured against loss by fire or other hazards in an amount not less than the total debt secured by this Deed of Trust. All policies shall be held by the Beneficiary, and be in such companies as the Beneficiary may approve and have loss payable first to the Beneficiary, as its interest may appear, and then to the Grantor(s). The amount collected under any insurance policy may be applied upon any indebtedness hereby secured in such order as the Beneficiary shall determine. Such application by the Beneficiary shall not cause discontinuance of any proceedings to foreclose this Deed of Trust. In the event of foreclosure, all rights of the Grantor(s) in insurance policies then in force shall pass to the purchaser at the foreclosure sale.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>To defend any action or proceeding purporting to affect
                the security hereof or the rights or powers of Beneficiary
                or Trustee, and to pay all costs and expenses, including cost of
                title search and attorney's fees in a reasonable amount, in any
                such action or proceeding, and in any suit brought by
                Beneficiary to foreclose this Deed of Trust.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>To pay all costs, fees, and expenses in connection with this Deed of Trust, including the expenses of the Trustee incurred in enforcing the obligation secured hereby and Trustee's and attorney's fees actually incurred, as provided by statute.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Should Grantor(s) fail to pay when due any taxes,
                assessments, insurance premiums, liens, encumbrances, or
                other charges against the property hereinabove described,
                Beneficiary may pay the same, and the amount so paid, with
                interest at the rate set forth in the note secured
                hereby, shall be added to and become a part of the
                debt secured in this Deed of Trust.<span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>DUE ON SALE: (<i>OPTIONAL – Not applicable unless initialed
                        by Grantor and Beneficiary.</i>) The property described in
                this security instrument may not be sold or transferred without
                the Beneficiary’s consent. Upon breach of this provision, Beneficiary
                may declare all sums due under the note and Deed of Trust immediately due
                and payable, unless prohibited by applicable law.</span>
                <p>&nbsp;</p>
                <table>
                    <tr>
                        <td>
                            <center>
                                <span class="labeled">___________________________________<span
                                class="label">Grantor initials</span></span>
                            </center>
                        </td>
                        <td>
                            <center>
                                <span class="labeled">___________________________________<span
                                class="label">Beneficiary initials</span></span>
                            </center>
                        </td>
                    </tr>
                </table>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>NO FURTHER ENCUMBRANCES: (OPTIONAL – Not applicable unless initialed by Grantor and Beneficiary.). As an express condition of Beneficiary making the loan secured by this Deed of Trust, Grantor shall not further encumber, pledge, mortgage, hypothecate, place any lien, charge or claim upon, or otherwise give as security the property or any interest therein nor cause or allow by operation of law the encumbrance of the Trust Estate or any interest therein without the written consent of a Beneficiary even though such encumbrance may be junior to the encumbrance created by this Deed of Trust. Encumbrance of the property contrary to the provisions of this provision shall constitute a default and Beneficiary may, at Beneficiary’s option, declare the entire balance of principal and interest immediately due and payable, whether the same be created by Grantor or an unaffiliated third party asserting a judgment lien, mechanic’s or materialmen’s lien or any other type of encumbrance or title defect.</span>
                <p>&nbsp;</p>
            </li>
        </ol>
        <p>&nbsp;</p>
        <p>IT IS MUTUALLY AGREED THAT:</p>
        <p>&nbsp;</p>
        <ol class="left-padded" style="margin: 0">
            <li>
                <span>In the event any portion of the property is taken or damaged in an eminent domain proceeding, the entire amount of the award or such portion as may be necessary to fully satisfy the obligation secured by this Deed of Trust shall be paid to Beneficiary to be applied to said obligation.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>By accepting payment of any sum secured by this Deed of
                Trust after its due date, Beneficiary does not waive its
                right to require prompt payment when due of all other sums so
                secured or to declare default for failure to so pay.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>The Trustee shall reconvey all or any part of the property covered by this Deed of Trust to the person entitled thereto, on written request of the Grantor(s) and the Beneficiary, or upon satisfaction of the obligation secured and written request for reconveyance made by the Beneficiary or the person entitled thereto.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Upon default by Grantor(s) in the payment of any indebtedness secured by this Deed of Trust or in the performance of any agreement contained in this Deed of Trust, all sums secured hereby shall immediately become due and payable at the option of the Beneficiary subject to any cure period provided in the note secured by this Deed of Trust. In such event and upon written request of Beneficiary, Trustee shall sell the trust property, in accordance with the Deed of Trust Act of the State of Washington, at public auction to the highest bidder. Any person except Trustee may bid at Trustee's sale. Trustee shall apply the proceeds of the sale as follows: (1) to the expense of the sale, including a reasonable Trustee's fee and attorney's fee; (2) to the obligation secured by this Deed of Trust; and (3) the surplus, if any, shall be distributed to the persons entitled thereto.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>Trustee shall deliver to the purchaser at the sale its deed, without warranty, which shall convey to the purchaser all right, title and interest in the real and personal property which Grantor(s) had or had the power to convey at the time of the execution of this Deed of Trust, and such as Grantor(s) may have acquired thereafter. Trustee's deed shall recite the facts showing that the sale was conducted in compliance with all the requirements of law and of this Deed of Trust, which recital shall be prima facie evidence of such compliance and conclusive evidence thereof in favor of bona fide purchaser and encumbrancers for value.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>The power of sale conferred by this Deed of Trust and by
                the Deed of Trust Act of the State of Washington is not
                an exclusive remedy; Beneficiary may cause this Deed of Trust to
                be foreclosed as a mortgage.<span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>In the event of the absence, death, incapacity, disability, or resignation of Trustee, or at the discretion of the Beneficiary, Beneficiary may appoint in writing a successor trustee, and upon the recording of such appointment in the mortgage records of the county in which this Deed of Trust is recorded, the successor trustee shall be vested with all powers of the original trustee. The trustee is not obligated to notify any party hereto of pending sale under any other Deed of Trust or of an action or proceeding in which Grantor(s), Trustee, or Beneficiary shall be a party unless such action or proceeding is brought by the Trustee.</span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>This Deed of Trust applies to, inures to the benefit of,
                and is binding not only on the parties hereto, but on
                his/her/their heirs, devisees, legatees,
                administrators, executors, and assigns. The term Beneficiary shall
                mean the holder and owner of the note secured hereby, whether
                or not named as Beneficiary herein.<span>
                <p>&nbsp;</p>
            </li>
            <li>
                <span>ADDITIONAL TERMS AND CONDITIONS: (check one)</span>
                <p>&nbsp;</p>
                <ol class="alpha left-padded" style="margin: 0">
                    <li>
                        <span>({% if addit_terms_condits.a.checked
                        %}<b>&#10004;</b>{% endif %}) None</span>
                        <p>&nbsp;</p>
                    </li>
                    <li>
                        {% if addit_terms_condits.b.checked %} 
                            <span>(<b>&#10004;</b>) As set forth on the attached
                            Exhibit <b>{{ addit_terms_condits.b.exhibit }}</b> which is incorporated by this
                            reference.</span>
                        {% else %} 
                            <span>() As set forth on the attached Exhibit _______
                            which is incorporated by this reference.</span>
                        {% endif %} 
                        <p>&nbsp;</p>
                    </li>
                    <p>(Note: If neither “a” nor “b” is checked, then option
                    “a” applies.)</p>
                </ol>
                <p>&nbsp;</p>
            </li>
        </ol>
        <p>STATE OF</p>
        <p>&nbsp;</p>
        <p>COUNTY OF</p>
        <p>&nbsp;</p>
        <p>I certify that I know or have satisfactory evidence that <b>{{ they
        }}</b> (is/are) the person(s) who appeared before me, and said
        person(s) acknowledged that <b>{{ said_persons_acknowledged_that
        }}</b> signed this instrument and acknowledged it to be <b>{{
        acknowledged_it_to_be }}</b> free and voluntary act for the
        uses and purposes mentioned in this instrument.</p>
        <p>&nbsp;</p>
        <p>Dated:</p>
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
        <center>REQUEST FOR FULL RECONVEYANCE - <i>Do not record.  To be used only
        when note has been paid.</i></center>
        <p>&nbsp;</p>
        <p>TO: TRUSTEE</p>
        <p>&nbsp;</p>
        <p>The undersigned is the legal owner and holder of the note and all other indebtedness secured by the within Deed of Trust. Said note, together with all other indebtedness secured by said Deed of Trust, has been fully paid and satisfied; and you are hereby requested and directed, on payment to you of any sums owing to you under the terms of said Deed of Trust, to cancel said note above mentioned, and all other evidences of indebtedness secured by said Deed of Trust delivered to you herewith, together with the said Deed of Trust, and to reconvey, without warranty, to the parties designated by the terms of said Deed of Trust, all the estate now held by you thereunder.</p>
        <p>&nbsp;</p>
        <p>Dated:</p>
    </div>
</body>
</html>
