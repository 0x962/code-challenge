import React from "react"
import PropTypes from "prop-types"

class BusinessInvoices extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      invoices: {
        data: [],
        api_status: 'pending'
      }
    }
  }

  componentDidMount() {
    let promise = this.fetchInvoices()
  }

  fetchInvoices = async () => {
    let response = await fetch(`/api/v1/invoices/?company_id=${this.props.company_id}`);

    if (!response.ok) {
      this.setState({invoices: {data: [], api_status: 'failed'}});
      return;
    }

    let jsonResponse = await response.json();
    this.setState({invoices: {data: jsonResponse['data'], api_status: 'completed'}})
  }

  updateStatus = async (id, status) => {
    const requestBody = {
      invoice: {
        status: status
      }
    };
    let response = await fetch(`/api/v1/invoices/${id}`, {
      method: 'PATCH',
      body: JSON.stringify(requestBody)
    });

    if (!response.ok) {
      alert('An error occurred when changing the status of the invoice');
      return;
    }

    let promise = this.fetchInvoices();
  }

  showApiStatus = () => {
    const {
      invoices: {
        api_status
      }
    } = this.state;

    if (api_status === 'pending') {
      return (<><p>Fetching Data...</p></>)
    }

    if (api_status === 'failed') {
      return (<><p>An error has occurred. Please try again.</p></>)
    }

    return (<></>)
  }

  showInvoices = () => {
    const {
      invoices: {
        data,
        api_status
      }
    } = this.state;

    if (api_status !== 'completed') {
      return (<></>)
    }

    return (
        <React.Fragment>
          <table className={'table table-striped table-condensed'}>
            <thead>
              <tr>
                <th>ID</th>
                <th>Status</th>
                <th>Amount</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
            {
              data.map((iv, i) => <tr key={i}>
                <td>{iv.attributes.id}</td>
                <td>{iv.attributes.status}</td>
                <td>{iv.attributes.amount}</td>
                <td><a href='' className={'text-success'} onClick={() => {let promise = this.updateStatus(iv.id, 'approved')}}>approve</a> <a onClick={() => {let promise = this.updateStatus(iv.id, 'rejected')}} href='' className={'text-danger'}>decline</a></td>
              </tr>)
            }
            </tbody>
          </table>
        </React.Fragment>
    )
  }

  render () {
    return (
      <React.Fragment>
        {this.showApiStatus()}
        {this.showInvoices()}
      </React.Fragment>
    );
  }
}

BusinessInvoices.propTypes = {
  company_id: PropTypes.number
};

export default BusinessInvoices
