import React from "react";
import PropTypes from "prop-types";

class BusinessLocationMap extends React.Component {
    constructor(props) {
        super(props);

        this.state = {
            goog: {
                api_key: 'AIzaSyC0n2yfgKsEzwyOTuG9T2Mbb-7SXWHTWHc'
            }
        }
    }

    render () {
        const {
            goog: {
                api_key
            }
        } = this.state;

        return (
          <React.Fragment>
            <iframe width="600" height="450" frameBorder="0" style={{border: 0}}
                    src={`https://www.google.com/maps/embed/v1/place?key=${api_key}&q=${this.props.location}`} allowFullScreen>
            </iframe>
          </React.Fragment>
        );
  }
}

BusinessLocationMap.propTypes = {
  location: PropTypes.string
};

export default BusinessLocationMap
