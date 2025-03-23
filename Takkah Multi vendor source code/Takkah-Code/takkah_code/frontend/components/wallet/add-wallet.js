import React, { useEffect, useState } from "react";
import InputText from "../form/form-item/InputText";
import { PaymentApi } from "../../api/main/payment";
import { shallowEqual, useSelector } from "react-redux";
import CheckboxCircleFillIcon from "remixicon-react/CheckboxCircleFillIcon";
import CheckboxBlankCircleLineIcon from "remixicon-react/CheckboxBlankCircleLineIcon";
import { useTranslation } from "react-i18next";
import DiscordLoader from "../loader/discord-loader";

const AddWallet = () => {
  const { t: tl } = useTranslation();
  const shop = useSelector((state) => state.stores.currentStore, shallowEqual);
  const [paymentType, setPaymentType] = useState(null);
  const [selectedPayment, setSelectedPayment] = useState(null);
  const [value, setValue] = useState(0);

  const getPayment = () => {
    PaymentApi.get({ shop_id: shop?.id })
      .then(({ data }) => {
        const newData = data?.filter((item) => item.payment.tag !== "wallet");
        setPaymentType(newData);
      })
      .catch((error) => {
        console.log(error);
      });
  };
  useEffect(() => {
    getPayment();
  }, []);

  const onFinish = () => {};

  return (
    <div className="add-wallet">
      <InputText
        label="Amount"
        placeholder="0"
        onChange={(e) => setValue(e.target.value)}
      />
      <div className="method">
        <div className="title">{tl("Payment method")}</div>
        <div className="method-items">
          {paymentType ? (
            paymentType?.map((type, key) => (
              <div
                key={key}
                className="method-item"
                onClick={() => setSelectedPayment(type.payment)}
              >
                <div
                  className={`icon ${
                    selectedPayment?.id === type.payment.id && "select"
                  }`}
                >
                  {selectedPayment?.id === type.payment.id ? (
                    <CheckboxCircleFillIcon />
                  ) : (
                    <CheckboxBlankCircleLineIcon />
                  )}
                </div>
                <div className="label">{type.payment.translation.title}</div>
              </div>
            ))
          ) : (
            <DiscordLoader />
          )}
        </div>
      </div>
      <div className="btn btn-success">Top up wallet</div>
    </div>
  );
};

export default AddWallet;
