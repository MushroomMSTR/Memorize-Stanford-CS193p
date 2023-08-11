//
//  Pie.swift
//  Memorize
//
//  Created by NazarStf on 11.08.2023.
//

import SwiftUI

// MARK: - Pie Shape
struct Pie: Shape {
	// MARK: - Properties
	var startAngle: Angle
	var endAngle: Angle
	var clockwise: Bool = false
	
	// MARK: - Animatable Data
	var animatableData: AnimatablePair<Double, Double> {
		get {
			AnimatablePair(startAngle.radians, endAngle.radians)
		}
		set {
			startAngle = Angle.radians(newValue.first)
			endAngle = Angle.radians(newValue.second)
		}
	}
	
	// MARK: - Path Creation
	func path(in rect: CGRect) -> Path {
		let center = CGPoint(x: rect.midX, y: rect.midY)
		let radius = min(rect.width, rect.height) / 2
		let start = CGPoint(
			x: center.x + radius * CGFloat(cos(startAngle.radians)),
			y: center.y + radius * CGFloat(sin(startAngle.radians))
		)
		
		// MARK: - Path Construction
		var p = Path()
		p.move(to: center)
		p.addLine(to: start)
		p.addArc(
			center: center,
			radius: radius,
			startAngle: startAngle,
			endAngle: endAngle,
			clockwise: !clockwise
		)
		p.addLine(to: center)
		return p
	}
}
