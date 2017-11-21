import React, { Component } from 'react';
import env from './env'
import logo from './logo.svg';
import './App.css';

console.log('env', env)

class App extends Component {
  componentWillMount() {
    this.setState({ pets: [] })
    fetch(`${env.PETS_API_URL}v1/pets`)
      .then(res => res.json())
      .then(pets => {
        this.setState({ pets })
      })
  }
  render() {
    return (
      <div className="App">
        <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <h1 className="App-title">Pet Reminder</h1>
        </header>
        <p className="App-intro">
          Remind your pet(s) to eat!
        </p>
        {
          !!this.state.pets.length &&
          <h2>List of pets</h2>
        }
        <ul className='App-list'>
          {this.state.pets.map(pet => {
            return <li key={pet._id}>{pet.name} ({pet.type})</li>
          })}
        </ul>
      </div>
    );
  }
}

export default App;
